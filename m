Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD17519E7F9
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753029881; cv=none; b=O5YtRVTVfzq4EsxaxF+9RHJ6BZhtAmnzO6PhC4kaeRrLHMrYlpKtJbggv/xVi85jKl6Sw3dJ93ox/QbH5PeDDXoJG9l9Dmeapa8cs+XQd2SoSIlKKWSpES7mPuktwKv+WK3/cef7C/wEqisBkm200GCyHKmSMpanqMNVMwipwNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753029881; c=relaxed/simple;
	bh=qh+GvFzinSFnMqEm7gSFiBDrgcPsDhuxKpbQOeXxUo4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ctw/gJh/uxccYgOtN4HSaPtvfue3j+ngIvgR6S00Xd/e9f1fMb1HS05xAEbqEEmbuSzNKRRM6K6m35y2oSRQ/V+jHOcbsOTzZZf8fYOPQ+nUpZGm0EQ8H+vaTiUCPrHpYFEFBVgrGu1DiNsa1J9gv0vCZXw1A/bhZSzhOO2fBWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=cBXI5JAW; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="cBXI5JAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1753029869; x=1753289069;
	bh=IYED6AgoqeXMLSrrVNfUGjYtQksbwFsWBe298tj6Qug=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cBXI5JAWd+XK7HGyhVFVIqvT3HNGyhd7dBHUYl0uLa9aEZZ+nj7mW/O/SXnTEr27w
	 20Vr6hDEQ/imsPea0wfvMm59DRUkYTSRo8pGVDnd9IyaY3En2EDRdCbMwlLr1WyrAc
	 zYjJuvvkLGikHirVic04RBr5N5R14HTKW+DIbmm2vY60oQxBNBL/fNznjE+KF36Hmb
	 5f4ZHFc5/wgjXFyf++3Jg9RjQ7ThULIRc3kP4GWRviTAKcMwGTDtVK6DP9cxK+iw5u
	 k1pe91j5gwqKQTatMunlK0HScp0exhDxEfUkLWgJcUSQg9MOZ0AkpEy/xr2F76GRek
	 RcXsDaiQ0++Iw==
Date: Sun, 20 Jul 2025 16:44:26 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, Benjamin Tissoires <benjamin.tissoires@redhat.com>, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, db48x@db48x.net, gary@garyguo.net, ojeda@kernel.org, tmgross@umich.edu, peter.hutterer@who-t.net
Subject: Re: [PATCH v2 3/4] rust: core abstractions for HID drivers
Message-ID: <87o6testga.fsf@protonmail.com>
In-Reply-To: <CANiq72m1itFYJgtyG02qnW1qyZU9UEo6OSLfzkXGesXNggxyBA@mail.gmail.com>
References: <20250713211012.101476-4-sergeantsagara@protonmail.com> <20250713211012.101476-10-sergeantsagara@protonmail.com> <CANiq72m1itFYJgtyG02qnW1qyZU9UEo6OSLfzkXGesXNggxyBA@mail.gmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 5f8b50a2c120dd1d8a3fb39812c3489d8a1d148d
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Jul, 2025 23:57:38 +0200 "Miguel Ojeda" <miguel.ojeda.sandonis@g=
mail.com> wrote:
>> +    /// Returns the HID report group.
>> +    pub fn group(&self) -> u16 {
>> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct hid_de=
vice`
>> +        unsafe { *self.as_raw() }.group
>> +    }
>
> Do you need to expose the group as a raw integer?
>
> Also, are these used currently?

Hi Miguel,

I originally did not expose the report group in the Rust bindings since
I did not make use of them. Benjamin has a preference access to them be
exposed in the initial bindings. I exposed this before implementing the
enum in a later revision. I agree that we should wrap this using the
enum now.

Thanks,
Rahul Rameshbabu

