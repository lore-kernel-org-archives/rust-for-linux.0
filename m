Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED7472068
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567573; cv=pass; b=KSxwj0Aar08BmkA3Ihb/ef17bkiz5E/jniGDoo9GQ8+B70IgqCW4gC82m2FZ/Ygu25tJH/AIkYQyR2zEvTVn+FupPvRWd1zj4K2+DTXBEaHOnt+m2l3x7MXF3jTAowd41rjo39Jn53oeDtGHD6W0BEH0ypk4q7NcQ+wYfZajxOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567573; c=relaxed/simple;
	bh=qzcT6qYje4sTTAgqTEl0t5dBA8W8kQg7XXcN3EpCiOE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mHY1iF1dXG3xNSZN7GbJl0lflXGNwhCxwy3DJti6jGf58PKm/IxHb5YKPx72X7SovmZAWUjkK1aQBR8RogoOScg3XK0ndih48jTRrRcEHXIkv7dhwUC7dQHxw1yZXG6pubcSldsgO0h7jz7OD35mtKJ7/QAV5IyytRmPkiK675s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Yr3ERYzM; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Yr3ERYzM"
ARC-Seal: i=1; a=rsa-sha256; t=1791567564; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aFKK2jtCkxadHKQCDvVf5dnKU+isNv5s0xjCR+l2EkdE275cXGCi5pq2TrpLLvbcErXugOuj5q9Ylo7E/leGwtKMf7qDbbci/t17VbIz8QD7Jd8EweyV4suM5OLIdPJ6O7G0XvnjFriHysmwTNUgifhWfY6dJB5OU6Aq+fy7V7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791567564; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t3G3vXPPdNIpz8RR0v8taZMHAiuT2sSRJwChXCRd0dE=; 
	b=Pt0VOvIbuovuqFuHyac2WvuI9PRO7YUFfOk6WW4DhWiENFg0zrAzVATjR+bQhnkOAA22IJSTLvyJNdxtwWAJbYHV37O5ufHYY/h86/Qg8vuV1OWMzLeDHApvZfSStZYWMZvJQab0+L9AVd8sT5CUQp8RutG1NlWzHSFZZMu/+20=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791567564;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=t3G3vXPPdNIpz8RR0v8taZMHAiuT2sSRJwChXCRd0dE=;
	b=Yr3ERYzMEGMjItiZxawJVRWJZwnk/YfDMxUAtYhKDJ8oNOvhOxYRzv+kPfufokY0
	tdoyhsq1IlQqdXXrIoKXQ0QjRKbkpSuHA+fimQWTALfk2nAYOFpLpyfT+GbsuDDi8E9
	0lmh/s/haQ5Oxzgn+jiCw+8gUO6vDDvNU66MK5J0=
Received: by smtp.zohomail.com with SMTPS id 1791567563263601.7843812794108;
	Fri, 9 Oct 2026 10:39:23 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH 2/7] rust: drm: gem: gate open/close callbacks with
 RegistrationGuard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260814232106.01AA71F000E9@smtp.kernel.org>
Date: Fri, 9 Oct 2026 14:39:08 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 ojeda@kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E989BBD7-DF97-4384-AFC1-3D7448A1C747@collabora.com>
References: <20260814230923.1292966-1-dakr@kernel.org>
 <20260814230923.1292966-3-dakr@kernel.org>
 <20260814232106.01AA71F000E9@smtp.kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External



> On 14 Aug 2026, at 20:21, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> - [High] Bypassing `T::close` when the DRM device is unregistered =
leaks driver-specific resources and software state allocated in =
`T::open`.
> - [High] Wrapping the entire `open` and `close` callbacks in =
`RegistrationGuard` introduces a severe AB-BA deadlock hazard with the =
device unplug path.
> --
>=20
> --- Patch [2]: [PATCH 2/7] rust: drm: gem: gate open/close callbacks =
with RegistrationGuard ---
> commit 56b4431da0d3b7c0798814690d882352e01b7d71
> Author: Danilo Krummrich <dakr@kernel.org>
>=20
> rust: drm: gem: gate open/close callbacks with RegistrationGuard
>=20
> Wrap the GEM object open and close callbacks with a RegistrationGuard
> (drm_dev_enter / drm_dev_exit) to ensure the driver callbacks only run
> while the parent bus device is bound.
>=20
> If the device has been unbound, open returns -ENODEV and close =
silently
> returns. This prevents driver code from accessing device resources =
after
> unbind and is a prerequisite for making drm::Driver::File
> lifetime-parameterized.
>=20
>> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
>> index 80d8f524f9d57..560403ca8e38f 100644
>> --- a/rust/kernel/drm/gem/mod.rs
>> +++ b/rust/kernel/drm/gem/mod.rs
>> @@ -128,6 +128,14 @@ extern "C" fn open_callback<T: DriverObject>(
>>     raw_obj: *mut bindings::drm_gem_object,
>>     raw_file: *mut bindings::drm_file,
>> ) -> core::ffi::c_int {
>> +    // SAFETY: `raw_obj` is a valid pointer to a `struct =
drm_gem_object` with a valid `dev`.
>> +    let dev: &drm::Device<T::Driver, drm::Userspace> =3D
>> +        unsafe { drm::Device::from_raw((*raw_obj).dev) };
>> +
>> +    let Some(_guard) =3D dev.registration_guard() else {
>=20
> [Severity: High]
> Could this cause an AB-BA deadlock with the device unplug path?
>=20
> If an unbind thread acquires a driver-specific lock and then calls
> drm_dev_unplug(), it will block in synchronize_srcu(&drm_unplug_srcu)
> waiting for SRCU read sections to finish.
>=20
> Concurrently, if a userspace thread opens a GEM handle, this
> registration_guard() call takes the drm_unplug_srcu read lock.
>=20
> When the callback proceeds to call T::open(), the driver might try to
> acquire the same driver-specific lock held by the unbind thread, =
deadlocking
> the system.
>=20
>> +        return ENODEV.to_errno();
>> +    };
>> +
>>     // SAFETY: `open_callback` is only ever called with a valid =
pointer to a `struct drm_file`.
>>     let file =3D unsafe { DriverFile::<T>::from_raw(raw_file) };
>=20
> [ ... ]
>=20
>> @@ -148,6 +156,14 @@ extern "C" fn close_callback<T: DriverObject>(
>>     raw_obj: *mut bindings::drm_gem_object,
>>     raw_file: *mut bindings::drm_file,
>> ) {
>> +    // SAFETY: `raw_obj` is a valid pointer to a `struct =
drm_gem_object` with a valid `dev`.
>> +    let dev: &drm::Device<T::Driver, drm::Userspace> =3D
>> +        unsafe { drm::Device::from_raw((*raw_obj).dev) };
>> +
>> +    let Some(_guard) =3D dev.registration_guard() else {
>> +        return;
>=20
> [Severity: High]
> Is it safe to return early here without calling T::close()?
>=20
> If a GEM object is created while the device is bound, and the device =
is then
> hot-unplugged, the guard check will fail.
>=20
> Returning early skips the software cleanup in T::close(), which could
> permanently leak driver-specific memory and state (like tracking lists =
or IDR
> entries) allocated during T::open().

I wonder if this is a problem in practice? And if so, would passing a =
e.g.:
Option<&File> be a solution?

=46rom a purely logical perspective, I do agree that a balanced =
open()/close()
makes more sense than silently skipping close() though.

>=20
>> +    };
>> +
>>     // SAFETY: `open_callback` is only ever called with a valid =
pointer to a `struct drm_file`.
>>     let file =3D unsafe { DriverFile::<T>::from_raw(raw_file) };
>>=20
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20260814230923.1292966-1-dakr@kernel.org?pa=
rt=3D2

