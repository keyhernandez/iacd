package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(ClaseController)
@Mock(Clase)
class ClaseControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/clase/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.claseInstanceList.size() == 0
        assert model.claseInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.claseInstance != null
    }

    void testSave() {
        controller.save()

        assert model.claseInstance != null
        assert view == '/clase/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/clase/show/1'
        assert controller.flash.message != null
        assert Clase.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/clase/list'

        populateValidParams(params)
        def clase = new Clase(params)

        assert clase.save() != null

        params.id = clase.id

        def model = controller.show()

        assert model.claseInstance == clase
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/clase/list'

        populateValidParams(params)
        def clase = new Clase(params)

        assert clase.save() != null

        params.id = clase.id

        def model = controller.edit()

        assert model.claseInstance == clase
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/clase/list'

        response.reset()

        populateValidParams(params)
        def clase = new Clase(params)

        assert clase.save() != null

        // test invalid parameters in update
        params.id = clase.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/clase/edit"
        assert model.claseInstance != null

        clase.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/clase/show/$clase.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        clase.clearErrors()

        populateValidParams(params)
        params.id = clase.id
        params.version = -1
        controller.update()

        assert view == "/clase/edit"
        assert model.claseInstance != null
        assert model.claseInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/clase/list'

        response.reset()

        populateValidParams(params)
        def clase = new Clase(params)

        assert clase.save() != null
        assert Clase.count() == 1

        params.id = clase.id

        controller.delete()

        assert Clase.count() == 0
        assert Clase.get(clase.id) == null
        assert response.redirectedUrl == '/clase/list'
    }
}
