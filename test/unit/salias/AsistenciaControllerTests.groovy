package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(AsistenciaController)
@Mock(Asistencia)
class AsistenciaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/asistencia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.asistenciaInstanceList.size() == 0
        assert model.asistenciaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.asistenciaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.asistenciaInstance != null
        assert view == '/asistencia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/asistencia/show/1'
        assert controller.flash.message != null
        assert Asistencia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/asistencia/list'

        populateValidParams(params)
        def asistencia = new Asistencia(params)

        assert asistencia.save() != null

        params.id = asistencia.id

        def model = controller.show()

        assert model.asistenciaInstance == asistencia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/asistencia/list'

        populateValidParams(params)
        def asistencia = new Asistencia(params)

        assert asistencia.save() != null

        params.id = asistencia.id

        def model = controller.edit()

        assert model.asistenciaInstance == asistencia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/asistencia/list'

        response.reset()

        populateValidParams(params)
        def asistencia = new Asistencia(params)

        assert asistencia.save() != null

        // test invalid parameters in update
        params.id = asistencia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/asistencia/edit"
        assert model.asistenciaInstance != null

        asistencia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/asistencia/show/$asistencia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        asistencia.clearErrors()

        populateValidParams(params)
        params.id = asistencia.id
        params.version = -1
        controller.update()

        assert view == "/asistencia/edit"
        assert model.asistenciaInstance != null
        assert model.asistenciaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/asistencia/list'

        response.reset()

        populateValidParams(params)
        def asistencia = new Asistencia(params)

        assert asistencia.save() != null
        assert Asistencia.count() == 1

        params.id = asistencia.id

        controller.delete()

        assert Asistencia.count() == 0
        assert Asistencia.get(asistencia.id) == null
        assert response.redirectedUrl == '/asistencia/list'
    }
}
