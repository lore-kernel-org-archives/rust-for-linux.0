Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9149624EAB1
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 04:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755665230; cv=none; b=TQwIHe+kZcGDmhg1hZBbXLdwARoZtdnfvDhpBBOt5LnHgdOsdSgWFj5ZT621B3ut+KoqH1NabZXeitey5iVvGa6WEAQdE/eWlWjS1pdLvdDay4bmSqGijALJQFHTUsbN8vyRI2TZtKorfrjoO9Sq5uhvz2gTKgSkXmMgHuuxFBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755665230; c=relaxed/simple;
	bh=H+hmRhOUdJIQOWA7MoeeChMlCXqd6iW6mSUpm6KLTgQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ckxft0/VjUtqyG9UkfnY1J1vEAtRgedXDFM9+v9TK3a2MCnU7R3O/iPZCahNEyTWeA5W5iRn7fMsaVbYUDgUv3KHSh6tpwwuzANRglh8g1mBaiPouCOc9d+ZyTjR2OcOvaWRorwAoVn9bBBY4tY0AgyXDR2SXbKWrusAJxZn7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ghhsMMsE; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ghhsMMsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1755665220; x=1755924420;
	bh=H+hmRhOUdJIQOWA7MoeeChMlCXqd6iW6mSUpm6KLTgQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ghhsMMsEHXcAb3uyp42Pbxl9JVZroFgWo41jFN7GDwntqO8xABhbef2KB9cnPGcUy
	 DvXBCpGo58s1PN3Ikh8q7Dd37DyrIrL4S/7Gtw7JTA7bJoGO3aAvlhe4w6eh0s4xmJ
	 Vab7iertxyz2giusvQ1+JECSy4/+GEf8LRY+deyNY2oDLLBhTmzi8qP2HiDcBN9yFV
	 nE+zbz+495Ct9jdt5IHuHtcv1LqZOJqNU2qcvpwKsWUENpEgjxPv3EQvZe/jdFNr8x
	 Nf2UcMTdUzdKLYRbjVry7ju6wyOSHvYOeJq7ofNcM+UydMG3lAVFAVtJi3E+9SasLp
	 I0PW7ipkINngw==
Date: Wed, 20 Aug 2025 04:46:52 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector APIs in Rust
Message-ID: <87ect61txs.fsf@protonmail.com>
In-Reply-To: <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com> <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: c998b452f60dab47f9847f3197f5c57c7e8ddba8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Aug, 2025 11:06:40 +0200 "Maxime Ripard" <mripard@kernel.org> wr=
ote:
> Hi Rahul,
>
> On Mon, Aug 18, 2025 at 05:04:15AM +0000, Rahul Rameshbabu wrote:
>> I am working on a drm_connector scoped backlight API in Rust. I have bee=
n
>> looking through Hans de Goede's previous efforts on this topic to help
>> guide my design. My hope is to enable backlight control over external
>> displays through DDC or USB Monitor Control Class while also supporting
>> internal panels. In parallel, I would like to improve the driver
>> probing/selection mechanism when there are different candidates for driv=
ing
>> a backlight device. This initial RFC is mainly intended to sanity check
>> that the plumbing I have chosen for extending the DRM connector
>> functionality in Rust seems reasonable.
>
> It's a great goal, and I had that same discussion with Hans recently
> too, but I can't find the link between backling/DDC CI, and Rust. Can
> you elaborate?

Hi Maxime,

Sure, let me elaborate on this. You are right that plumbing DDC
CI/backlight support at the DRM connector level does not need to be
implemented in Rust.

If we look at Hans's proposal, the suggested phase 2 was to add a
drm_connector helper function for plumbing a pointer to the backlight
device implementation. I had some model differences with regards to how
the API would look like, mostly stemming from concerns about providing
better runtime overriding of the acpi_video_get_backlight_type based
backlight selection. However, I am aligned with the direction of scoping
at the drm_connector level. I basically was interested in implementing
this helper functionality in Rust instead of C, which is where Rust came
into play.

I was also interested in declaring and attaching a drm_property in Rust
for controlling properties such as backlight rather than updating the
drm_connector declaration in C as an experiment.

Let me know if you feel like this work would be better off as a C
implementation. I can also send out a detailed architecture proposal to
the mailing list if that would help.

Link: https://lore.freedesktop.org/wayland-devel/0d188965-d809-81b5-74ce-7d=
30c49fee2d@redhat.com/

Thanks,
Rahul Rameshbabu

>
> Maxime

