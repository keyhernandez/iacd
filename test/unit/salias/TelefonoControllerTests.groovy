package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(TelefonoController)
@Mock(Telefono)
class TelefonoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/telefono/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.telefonoInstanceList.size() == 0
        assert model.telefonoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.telefonoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.telefonoInstance != null
        assert view == '/telefono/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/telefono/show/1'
        assert controller.flash.message != null
        assert Telefono.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/telefono/list'

        populateValidParams(params)
        def telefono = new Telefono(params)

        assert telefono.save() != null

        params.id = telefono.id

        def model = controller.show()

        assert model.telefonoInstance == telefono
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/telefono/list'

        populateValidParams(params)
        def telefono = new Telefono(params)

        assert telefono.save() != null

        params.id = telefono.id

        def model = controller.edit()

        assert model.telefonoInstance == telefono
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/telefono/list'

        response.reset()

        populateValidParams(params)
        def telefono = new Telefono(params)

        assert telefono.save() != null

        // test invalid parameters in update
        params.id = telefono.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/telefono/edit"
        assert model.telefonoInstance != null

        telefono.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/telefono/show/$telefono.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        telefono.clearErrors()

        populateValidParams(params)
        params.id = telefono.id
        params.version = -1
        controller.update()

        assert view == "/telefono/edit"
        assert model.telefonoInstance != null
        assert model.telefonoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/telefono/list'

        response.reset()

        populateValidParams(params)
        def telefono = new Telefono(params)

        assert telefono.save() != null
        assert Telefono.count() == 1

        params.id = telefono.id

        controller.delete()

        assert Telefono.count() == 0
        assert Telefono.get(telefono.id) == null
        assert response.redirectedUrl == '/telefono/list'
    }
}
