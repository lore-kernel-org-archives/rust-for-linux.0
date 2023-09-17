Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D630A4A24
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 15:06:39 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E6EB6
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 08:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=0LFJs0sgU1okWFekXw++oiw4PHIH8JxvXYqFPok4AN8=; b=mG
	ruZ2caCb21Ib5vqvnRaU85z6PHS5Yj1AFfydaUrk/QhdU1ZOOfBgZUhaATvG964nlm1OZDauJSYnc
	hy2YqqfDcfmNqIZSoyiHCeK3r/qw7Z9y5NiqzPZ7Z1yA3XRUxD4IJ6PhNbAYLwBZVa+8wfHKF+bcF
	0YyIFxqEY9TF/zY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qhtM3-006hTC-E6; Sun, 17 Sep 2023 17:06:35 +0200
Date: Sun, 17 Sep 2023 17:06:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <20230917.191708.2174483069021340663.ubuntu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230917.191708.2174483069021340663.ubuntu@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 17, 2023 at 07:17:08PM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Wed, 13 Sep 2023 22:11:57 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
> 
> >> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> >> +        unsafe { &mut *(ptr as *mut Self) }
> >> +    }
> >> +
> >> +    /// Gets the id of the PHY.
> >> +    pub fn id(&mut self) -> u32 {
> >> +        let phydev = Opaque::get(&self.0);
> >> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> >> +        unsafe { (*phydev).phy_id }
> >> +    }
> >> +
> >> +    /// Returns true if the PHY has no link.
> >> +    pub fn link(&mut self) -> bool {
> >> +        let phydev = Opaque::get(&self.0);
> >> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> >> +        unsafe { (*phydev).link() != 0 }
> > 
> > That seems an odd way to express it.
> > 
> > unsigned link:1;
> > 
> > It is a bitfield of 1 bit. So why not simply == 1 ? Or even just plain
> > (*phydev).link() ?
> 
> The accessors is generated for bitfield. In this case:
> 
> pub fn link(&self) -> core::ffi::c_uint;
> pub fn set_link(&mut self, val: core::ffi::c_uint);

So Rust has thrown away the size of the bitfield?

struct foo {
  unsigned long bitfield:1;
  unsigned long nibblefield:4;
};

int main(int argc, char *argv[])
{
  struct foo foo;

  foo.bitfield=2;
  foo.nibblefield=42;
}

$ gcc -Wall test.c
test.c: In function ‘main’:
test.c:10:16: warning: unsigned conversion from ‘int’ to ‘unsigned char:1’ changes value from ‘2’ to ‘0’ [-Woverflow]
   10 |   foo.bitfield=2;
      |                ^
test.c:11:19: warning: unsigned conversion from ‘int’ to ‘unsigned char:4’ changes value from ‘42’ to ‘10’ [-Woverflow]
   11 |   foo.nibblefield=42;
      |

So i also assume Rust is not going to do these range checks? Will they
get done a runtime when the setter is called?

> a bit weird for 1 bit though.
> 
> The function name should be something is_linkup()?

Naming is hard. At least for the moment, anybody writing a PHY driver
is going to be using a C driver as a template. They will see code
like:

msc.c:	if (!phydev->link && priv && priv->edpd_enable &&
teranetics.c:	phydev->link = 1;
teranetics.c:			phydev->link = 0;
teranetics.c:			phydev->link = 0;
uPD60620.c:	phydev->link = 0;
uPD60620.c:			phydev->link = 1;

Since it appears your must have a getter/setter, i would keep with
get_link() and set_link().

> > Now we are getting into the hairy stuff. Locking is
> > interesting. Rather than duplicate all the interesting stuff, can you
> > just use the high level C functions? In fact, the driver you posted
> > does not need anything other than phy_read() and phy_write(), so i
> > would not even bother with these yet.
> 
> Yeah, I can't figure out a clean way to handle this.
> 
> The realtek driver uses them:
> 
> https://github.com/fujita/rust-realtek-phy/blob/master/rust_realtek.rs#L33
> 
> It implements .read_page and .write_page so read and write without
> locking the MDIO bus are necessary? Can we do in differently?

This locking is not nice, but it is mostly hidden away in the phylib
core. We probably don't want to duplicate it in Rust. So i would
suggest you wrap the high level API, phy_read_paged(),
phy_write_paged(), phy_modify_paged_changed().

rtl8211e_config_init() does:

        oldpage = phy_select_page(phydev, 0x7);
        if (oldpage < 0)
                goto err_restore_page;

        ret = __phy_write(phydev, RTL821x_EXT_PAGE_SELECT, 0xa4);
        if (ret)
                goto err_restore_page;

        ret = __phy_modify(phydev, 0x1c, RTL8211E_CTRL_DELAY
                           | RTL8211E_TX_DELAY | RTL8211E_RX_DELAY,
                           val);

err_restore_page:
        return phy_restore_page(phydev, oldpage, ret);

This should not be time critical, so i would turn this into
phy_read_paged() followed by phy_modify_paged().

rtlgen_read_mmd() is different.

phy_read_mmd() takes the MDIO bus lock and then calls
phydev->drv->read_mmd which is rtlgen_read_mmd(). This is why
__phy_read() is used. So you are going to need to wrap __phy_read()
and __phy_write().

Or we need to take a step back and take a long hard look at the
locking and try to clean it up and simplify it. It might then become
possible to duplicate the locking model in Rust.

> If abstraction code just declare a function, a driver always need to
> implement that function.

Ah, that is not going to scale well. There is something like 250
struct phy_driver at the moment. We keep adding new ops to that
structure. I really don't want to have to modify all 250 of those
structures when i add a new op which only one or two drivers need.

	   Andrew
