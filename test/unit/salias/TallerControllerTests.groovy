package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(TallerController)
@Mock(Taller)
class TallerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/taller/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tallerInstanceList.size() == 0
        assert model.tallerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tallerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tallerInstance != null
        assert view == '/taller/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/taller/show/1'
        assert controller.flash.message != null
        assert Taller.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/taller/list'

        populateValidParams(params)
        def taller = new Taller(params)

        assert taller.save() != null

        params.id = taller.id

        def model = controller.show()

        assert model.tallerInstance == taller
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/taller/list'

        populateValidParams(params)
        def taller = new Taller(params)

        assert taller.save() != null

        params.id = taller.id

        def model = controller.edit()

        assert model.tallerInstance == taller
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/taller/list'

        response.reset()

        populateValidParams(params)
        def taller = new Taller(params)

        assert taller.save() != null

        // test invalid parameters in update
        params.id = taller.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/taller/edit"
        assert model.tallerInstance != null

        taller.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/taller/show/$taller.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        taller.clearErrors()

        populateValidParams(params)
        params.id = taller.id
        params.version = -1
        controller.update()

        assert view == "/taller/edit"
        assert model.tallerInstance != null
        assert model.tallerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/taller/list'

        response.reset()

        populateValidParams(params)
        def taller = new Taller(params)

        assert taller.save() != null
        assert Taller.count() == 1

        params.id = taller.id

        controller.delete()

        assert Taller.count() == 0
        assert Taller.get(taller.id) == null
        assert response.redirectedUrl == '/taller/list'
    }
}
