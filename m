Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E1F1D0B82
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730811025; cv=none; b=MprWux1vhWLDdl19302k8GITMkBLbBQd5jnwuJARVCapluFs9kGP2Pyb5jxLhmgB0kbIwUd2wnfv6O4umfQHxpVk+JGEyIWicnCpxGdAFj/6KGVOCxqi0C66NHyiDUuzh0dPRvr9hb8LGYBHR9MG3wXL13FvsE7EvatgevJN2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730811025; c=relaxed/simple;
	bh=tGlnub81vYon/r8LWm4JYKyvA7PC3Wf8e4pqTOh5RQ0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ev1kL5kspo6nHBhvjc3qpDcW3FsygRdlXYHPQKe93KOVLprEAxa/19CALznGtLC+d7RkTUzQ4Kun/kc4URyWA/0vgBwbbykuq3K1CDrjZotdjeOYgOBk8N/g4Dmp7mKA4UEeQ5GukSPW932Nc20HRMmMksroGfIsbtaMiUb7N2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gqq+Rs02; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gqq+Rs02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730811022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=7x21kNdiACiJXhFGkdYysaj8J5RjTH6jKJXsNh3Wh9Y=;
	b=Gqq+Rs028J3OlVlPuNVmx+hZoip1YMoBKdwCqjF1JJb11r1KgEGr390lTwHGQ7e1Bm8YuB
	LeeNQWKFG9KCFBFtDzgD41xVx8bsrfWK+nPuk9RzynDif+gEPnxvUyj+WBIpAboGyXoZAY
	kqTj0XVOzwdsDvLU97ZN4DNvsrjboTU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-yg3pComwOZym7w_qiwj0IQ-1; Tue, 05 Nov 2024 07:50:19 -0500
X-MC-Unique: yg3pComwOZym7w_qiwj0IQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2fb3da343ceso37686211fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 04:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730811018; x=1731415818;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7x21kNdiACiJXhFGkdYysaj8J5RjTH6jKJXsNh3Wh9Y=;
        b=C92gXhOyLi1FfkJ4jT8e9U/FITLeZIHvopJjVdeLgElREP+Ho38Uo6jJ7HrGaYkCfH
         aivX8xT9VpppfOwJAsMrubRl5VKfDq9VVzAWn37fry08k1zI2lZxuypevo+r7gHDIiAT
         26NctJ6COiEs70rIH7pU6E+KGHL4sWrPAxjMieplRCvDsDdCJokK7fDLQ7YYyShqsvum
         h3Dsm7BHv5Q3IBkPad4Qa7lcqAJ6SL8woWPlo4SvjcDZxoC63a3wMn8ue9LFy+xcGW+d
         9AIfP6k6pQHJe0RptLlgzvRhhylkfZshb9hfL+Ttq64UcvHF1qMw2/GsFODMiNjEVDnm
         meLA==
X-Gm-Message-State: AOJu0Ywuf7annHKkzJ7EqPdGCcssD8EXAMEEZavo2muPiCmypVd8bRYL
	1gY1rV+yullH2WLVePCtHueljGJ+3ReRiovS2qTXVwxKG9OcXxv7wRu/v0nd9Wpm9HBmlt7JOmA
	RjT9xDdKu0zGkEjt1lgLRJpHJbPSEaxUmkRIUb016RjE4YxHEK2CxrFUcCIXXdmB64pccbV/5sb
	kFmb1lS4/0mAx42wjrHj0eVTEps8u9Py4eowHc0IZaDEDyQdSXTV+f
X-Received: by 2002:a05:6512:104d:b0:539:d10b:e389 with SMTP id 2adb3069b0e04-53b348f9681mr17620228e87.13.1730811017637;
        Tue, 05 Nov 2024 04:50:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsdmH5sX6POJNxAHtLEfA2un0DA0lPOTm/q4rFBRCU+zgSeFl5l15BXIMBWjif+PCwRC4c+tX5RvONfUvmF9M=
X-Received: by 2002:a05:6512:104d:b0:539:d10b:e389 with SMTP id
 2adb3069b0e04-53b348f9681mr17620210e87.13.1730811017078; Tue, 05 Nov 2024
 04:50:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 5 Nov 2024 13:50:04 +0100
Message-ID: <CABgObfZSCA9uvSOXuDx8mvD1-gkcfeZxQQ5CVyx294Fy4Q1EgQ@mail.gmail.com>
Subject: pinned_init vs. miri?
To: rust-for-linux@vger.kernel.org, y86-dev@protonmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="000000000000da14e5062629d7aa"

--000000000000da14e5062629d7aa
Content-Type: text/plain; charset="UTF-8"

Hi all,

tl;dr: while trying to learn more about pinned_init, I tried running a
simple example through miri, and I found out that it breaks.

The attached Rust code mimics a C component that calls a series of
callbacks with a void * opaque argument; plus Rust bindings for it,
that use pin_init!() to place a pointer to self in the opaque
argument.

The use of pin_init! is pretty simple, the only notable thing is that
in main() I "inlined" Box::pin_init() to clarify the miri output.

When I try to run this under miri, I get the following:

error: Undefined Behavior: trying to retag from <1750> for SharedReadOnly
permission at alloc877[0x0], but that tag does not exist in the borrow stack
for this location
   --> src/main.rs:25:37
    |
25  |         let owner: &'a T = unsafe { &*opaque.cast_const().cast::<T>() };
    |                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |                                     |
    |                                     trying to retag from <1750>
for SharedReadOnly
permission at alloc877[0x0], but that tag does not exist in the borrow stack
for this location
    |                                     this error occurs as part of
retag at alloc877[0x0..0x20]
    |
help: <1750> was created by a SharedReadWrite retag at offsets [0x0..0x20]
   --> src/main.rs:99:16
    |
99  |     let slot = backend.as_mut_ptr();
    |                ^^^^^^^^^^^^^^^^^^^^
help: <1750> was later invalidated at offsets [0x0..0x20] by a Unique retag
   --> src/main.rs:101:32
    |
101 |     let mut backend = unsafe { backend.assume_init() };
    |                                ^^^^^^^


In other words, the pointer to the Box<MaybeUninit<PrintlnLogger>>,
which was stored to be used later as the opaque pointer, became
invalid when assume_init() changed the box to a Box<PrintlnLogger>. It
is then invalid to dereference it.

The cause of this is basically that assume_init() consumes the
MaybeUninit<>; which also means that the same thing happens with
std::mem::forget(), Box::leak() or Box::into_raw().

This is not _that_ surprising in the end, but I was wondering if it is
a fundamental incompatibility between the stacked borrows model and
interior pointers, or if there are ways to fix it (I can't think of
any).

To test the attached pinned_init.rs, stick it as src/main.rs with a
Cargo.toml file like this:

[package]
name = "logger"
version = "0.1.0"
edition = "2021"

[dependencies]
pinned-init = "0.0"

and compile/run it with nightly Rust.

Thanks,

Paolo

--000000000000da14e5062629d7aa
Content-Type: text/rust; charset="US-ASCII"; name="pinned_init.rs"
Content-Disposition: attachment; filename="pinned_init.rs"
Content-Transfer-Encoding: base64
Content-ID: <f_m34fuiah0>
X-Attachment-Id: f_m34fuiah0

dXNlIHN0ZDo6bWVtOjpNYXliZVVuaW5pdDsKdXNlIHN0ZDo6b3M6OnJhdzo6Y192b2lkOwoKdXNl
IHBpbm5lZF9pbml0OjoqOwoKLy8vIEEgY2FsbGJhY2sgdG8gYSBsb2dnaW5nIGZ1bmN0aW9uIGBm
YC4KLy8vIFRoaXMgd291bGQgb3JkaW5hcmlseSBiZSBwcm92aWRlZCBieSBDIGNvZGUuCnB1YiBz
dHJ1Y3QgTG9nUmVnaXN0cmF0aW9uIHsKICAgIGY6IGZuKCZzdHIsICptdXQgY192b2lkKSwKICAg
IG9wYXF1ZTogKm11dCBjX3ZvaWQsCn0KCi8vLyBUaGUgUnVzdCB0cmFpdCB0aGF0IGlzIGltcGxl
bWVudGVkIGJ5IGEgbG9nZ2luZyBiYWNrZW5kCi8vLyBJdCBpcyB3cmFwcGVkIGJ5IFtgTG9nUmVn
aXN0cmF0aW9uOjpsb2dfZm5gXSB0byBjb252ZXJ0Ci8vLyBgJnNlbGZgIGludG8gYW4gb3BhcXVl
IHBvaW50ZXIuCnB1YiB0cmFpdCBMb2dCYWNrZW5kT3BzPCdhPiB7CiAgICBmbiBsb2coJnNlbGYs
IHM6ICZzdHIpOwp9CgppbXBsIExvZ1JlZ2lzdHJhdGlvbiB7CiAgICBmbiBsb2dfZm48J2EsIFQ6
ICdhICsgTG9nQmFja2VuZE9wczwnYT4+KHM6ICZzdHIsIG9wYXF1ZTogKm11dCBjX3ZvaWQpIHsK
ICAgICAgICAvLyBtaXJpIGZhaWx1cmUgaGVyZS4gIFRoZSBwb2ludGVyIHdhcyBjcmVhdGVkIGJ5
CiAgICAgICAgLy8gYmFja2VuZC5hc19tdXRfcHRyKCksIGJ1dCB0aGVuIGludmFsaWRhdGVkIGJ5
CiAgICAgICAgLy8gYmFja2VuZC5hc3N1bWVfaW5pdCgpCiAgICAgICAgbGV0IG93bmVyOiAmJ2Eg
VCA9IHVuc2FmZSB7ICYqb3BhcXVlLmNhc3RfY29uc3QoKS5jYXN0Ojo8VD4oKSB9OwogICAgICAg
IG93bmVyLmxvZyhzKTsKICAgIH0KCiAgICBwdWIgZm4gbmV3PCdhLCBUOiAnYSArIExvZ0JhY2tl
bmRPcHM8J2E+PigKICAgICAgICBvd25lcjogKmNvbnN0IFQsCiAgICApIC0+IGltcGwgSW5pdDxT
ZWxmPiArIHVzZTwnYSwgVD4gewogICAgICAgIGluaXQhKExvZ1JlZ2lzdHJhdGlvbiB7CiAgICAg
ICAgICAgIGY6IFNlbGY6OmxvZ19mbjo6PFQ+LAogICAgICAgICAgICBvcGFxdWU6IG93bmVyLmNh
c3RfbXV0KCkuY2FzdCgpLAogICAgICAgIH0pCiAgICB9Cn0KCi8vLyBBIGh5cG90aGV0aWNhbCBs
b2dnaW5nIGNvbXBvbmVudCB0aGF0IGFjY2VwdHMgbXVsdGlwbGUgYmFja2VuZHMgaW4KLy8vIHRo
ZSBmb3JtIG9mIGNhbGxiYWNrcy4gIFRoaXMgd291bGQgb3JkaW5hcmlseSBiZSBwcm92aWRlZCBi
eSBDIGNvZGUuCiNbZGVyaXZlKERlZmF1bHQpXQpwdWIgc3RydWN0IExvZ2dlcjwnYT4gewogICAg
dmVjOiBWZWM8JidhIExvZ1JlZ2lzdHJhdGlvbj4sCn0KCmltcGw8J2E+IExvZ2dlcjwnYT4gewog
ICAgcHViIGZuIGFkZF9jYWxsYmFjaygmbXV0IHNlbGYsIGNiOiAmJ2EgTG9nUmVnaXN0cmF0aW9u
KSB7CiAgICAgICAgc2VsZi52ZWMucHVzaChjYik7CiAgICB9CgogICAgcHViIGZuIGxvZygmc2Vs
ZiwgczogJnN0cikgewogICAgICAgIGZvciBjYiBpbiAmc2VsZi52ZWMgewogICAgICAgICAgICAo
Y2IuZikocywgY2Iub3BhcXVlKTsKICAgICAgICB9CiAgICB9Cn0KCi8vIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCi8vLyBSdXN0IGNsaWVudCBmb3IgYExvZ2dlcmAu
ICBVc2VzIGBwaW5faW5pdCFgIHRvIGNvbnN0cnVjdCBhCi8vLyBjYWxsYmFjaytvcGFxdWUgcGFp
ciB0aGF0IHBvaW50cyB0byBpdHNlbGYgYW5kIHRoYXQgY2FuIGJlCi8vLyBhZGRlZCB0byBhIGBM
b2dnZXJgLgojW3JlcHIoQyldCiNbcGluX2RhdGFdCnB1YiBzdHJ1Y3QgUHJpbnRsbkxvZ2dlciB7
CiAgICAjW3Bpbl0KICAgIGJhY2tlbmQ6IExvZ1JlZ2lzdHJhdGlvbiwKICAgIHB1YiBwcmVmaXg6
ICYnc3RhdGljIHN0ciwKfQoKaW1wbCBMb2dCYWNrZW5kT3BzPCdfPiBmb3IgUHJpbnRsbkxvZ2dl
ciB7CiAgICBmbiBsb2coJnNlbGYsIHM6ICZzdHIpIHsKICAgICAgICBwcmludGxuISgie317fSIs
IHNlbGYucHJlZml4LCBzKTsKICAgIH0KfQoKaW1wbCBQcmludGxuTG9nZ2VyIHsKICAgIHB1YiBm
biBuZXcoKSAtPiBpbXBsIFBpbkluaXQ8U2VsZj4gewogICAgICAgIHBpbl9pbml0ISgmdGhpcyBp
biBQcmludGxuTG9nZ2VyIHsKICAgICAgICAgICAgYmFja2VuZCA8LSBMb2dSZWdpc3RyYXRpb246
Om5ldzo6PFNlbGY+KHRoaXMuYXNfcHRyKCkpLAogICAgICAgICAgICBwcmVmaXg6ICJ0ZXN0IiwK
ICAgICAgICB9KQogICAgfQoKICAgIHB1YiBmbiBhZGRfdG88J2E+KCYnYSBzZWxmLCBsOiAmbXV0
IExvZ2dlcjwnYT4pIHsKICAgICAgICBsLmFkZF9jYWxsYmFjaygmc2VsZi5iYWNrZW5kKTsKICAg
IH0KfQoKLy8gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKZm4gbWFp
bigpIC0+IFJlc3VsdDwoKSwgQm94PGR5biBzdGQ6OmVycm9yOjpFcnJvcj4+IHsKICAgIGxldCBt
dXQgbCA9IExvZ2dlcjo6ZGVmYXVsdCgpOwoKICAgIC8vIGxldCBtdXQgYmFja2VuZCA9IEJveDo6
cGluX2luaXQoUHJpbnRsbkxvZ2dlcjo6bmV3KCkpPzsKICAgIC8vCiAgICAvLyBleHBhbmRlZCBh
cyBmb2xsb3dzIGZvciBjbGVhcmVyIG1pcmkgb3V0cHV0OgogICAgbGV0IG11dCBiYWNrZW5kOiBC
b3g8TWF5YmVVbmluaXQ8UHJpbnRsbkxvZ2dlcj4+ID0gQm94OjpuZXdfdW5pbml0KCk7CiAgICBs
ZXQgc2xvdCA9IGJhY2tlbmQuYXNfbXV0X3B0cigpOwogICAgdW5zYWZlIHsgUHJpbnRsbkxvZ2dl
cjo6bmV3KCkuX19waW5uZWRfaW5pdChzbG90KT8gfTsKICAgIGxldCBtdXQgYmFja2VuZCA9IHVu
c2FmZSB7IGJhY2tlbmQuYXNzdW1lX2luaXQoKSB9OwoKICAgIGJhY2tlbmQucHJlZml4ID0gInRl
c3Q6ICI7CiAgICBiYWNrZW5kLmFkZF90bygmbXV0IGwpOwogICAgbC5sb2coImhlbGxvIHdvcmxk
Iik7CiAgICBPaygoKSkKfQo=
--000000000000da14e5062629d7aa--

