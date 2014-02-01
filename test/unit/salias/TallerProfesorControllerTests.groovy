package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(TallerProfesorController)
@Mock(TallerProfesor)
class TallerProfesorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tallerProfesor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tallerProfesorInstanceList.size() == 0
        assert model.tallerProfesorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tallerProfesorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tallerProfesorInstance != null
        assert view == '/tallerProfesor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tallerProfesor/show/1'
        assert controller.flash.message != null
        assert TallerProfesor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tallerProfesor/list'

        populateValidParams(params)
        def tallerProfesor = new TallerProfesor(params)

        assert tallerProfesor.save() != null

        params.id = tallerProfesor.id

        def model = controller.show()

        assert model.tallerProfesorInstance == tallerProfesor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tallerProfesor/list'

        populateValidParams(params)
        def tallerProfesor = new TallerProfesor(params)

        assert tallerProfesor.save() != null

        params.id = tallerProfesor.id

        def model = controller.edit()

        assert model.tallerProfesorInstance == tallerProfesor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tallerProfesor/list'

        response.reset()

        populateValidParams(params)
        def tallerProfesor = new TallerProfesor(params)

        assert tallerProfesor.save() != null

        // test invalid parameters in update
        params.id = tallerProfesor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tallerProfesor/edit"
        assert model.tallerProfesorInstance != null

        tallerProfesor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tallerProfesor/show/$tallerProfesor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tallerProfesor.clearErrors()

        populateValidParams(params)
        params.id = tallerProfesor.id
        params.version = -1
        controller.update()

        assert view == "/tallerProfesor/edit"
        assert model.tallerProfesorInstance != null
        assert model.tallerProfesorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tallerProfesor/list'

        response.reset()

        populateValidParams(params)
        def tallerProfesor = new TallerProfesor(params)

        assert tallerProfesor.save() != null
        assert TallerProfesor.count() == 1

        params.id = tallerProfesor.id

        controller.delete()

        assert TallerProfesor.count() == 0
        assert TallerProfesor.get(tallerProfesor.id) == null
        assert response.redirectedUrl == '/tallerProfesor/list'
    }
}
