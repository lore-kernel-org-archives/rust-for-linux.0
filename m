Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC961B375A
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Aug 2024 18:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724956917; cv=none; b=DteogVxMf6HzkOO+bmX1PQAmPnuVB3LXrDWiI8504L+muTkayXjciN4qsCbLLrPKdQb4XsJbf+U55mMSIz66zQi4VNSm6tbsDTeuIG6HZ0Kh6NYZ8jOTcZ9x4MLujWeOpX8RiLqPdH9StmjW2A9rgIVV1U3v3biDokH3Hg78mZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724956917; c=relaxed/simple;
	bh=Ri8Iq+XNnt2qpzFKTpza6I6CURiGsYsRcbTM0MWfmg8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gm7CQ+9e8+4Cr6dDEYlMB20rhiR+YvKIxFKYZg3XMTmphmxthXb2l7hsODmu8qQUv1nyJ3ViY7Lu1e+H2+WQQ/SCgaOQsdDMJ1RXUEn6jKi+Xbo7PrbXN1MQi94uyiIFWv1yvDY4jUfdsHASb1uWkaugfeoVmA8/VKcErK3+Juk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fFV3fCAd; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fFV3fCAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724956912; x=1725216112;
	bh=i4KVoHC/rTR85PP8ETqYzox9jgCZ/yEP3hbtTkzO924=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fFV3fCAd2JCDywKRm0nBUrpg9pLzHjZjlKURxQwDT1clwRMsPHZH64UDHYVj5Dl6Z
	 V5w4B/mYo8oY1GqGsrufC2ynGrxnEFT3etPzBZtGgpeXjcGSMCTZz56lTX0Fw11jJ8
	 t0imqDxXjw22c47TBinoK7Lhq6IVpYPDL71c2u6aS4ZWkUQNpOR0a8chl3SCOdGpwx
	 eRqDo07yOBa4z2Y15Kyi/JZ9/CQzvAHc0krkM7G1JGMim0Zqwfd2I8gCedqfcth9RN
	 nuTF0hBFylrmjmISrR+vm2UghpBgJACWmymtLESdCSA/5mQc0IP6+EN3M9XqAxp25b
	 wNKihpoZgARuA==
Date: Thu, 29 Aug 2024 18:41:49 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v6 20/26] rust: error: check for config `test` in `Error::name`
Message-ID: <31c429a4-9cf4-4cd1-98fe-4be75ffadc50@proton.me>
In-Reply-To: <20240816001216.26575-21-dakr@kernel.org>
References: <20240816001216.26575-1-dakr@kernel.org> <20240816001216.26575-21-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: e7003a03934d6c259a79677b7b24467c965d107b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16.08.24 02:11, Danilo Krummrich wrote:
> Additional to `testlib` also check for `test` in `Error::name`. This is
> required by a subsequent patch that (indirectly) uses `Error` in test
> cases.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/error.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 2d012cc3881a..7adf889b9526 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -140,7 +140,7 @@ pub(crate) fn to_ptr<T>(self) -> *mut T {
>      }
>=20
>      /// Returns a string representing the error, if one exists.
> -    #[cfg(not(testlib))]
> +    #[cfg(not(any(test, testlib)))]
>      pub fn name(&self) -> Option<&'static CStr> {
>          // SAFETY: Just an FFI call, there are no extra safety requireme=
nts.
>          let ptr =3D unsafe { bindings::errname(-self.0) };
> @@ -157,7 +157,7 @@ pub fn name(&self) -> Option<&'static CStr> {
>      /// When `testlib` is configured, this always returns `None` to avoi=
d the dependency on a
>      /// kernel function so that tests that use this (e.g., by calling [`=
Result::unwrap`]) can still
>      /// run in userspace.
> -    #[cfg(testlib)]
> +    #[cfg(any(test, testlib))]
>      pub fn name(&self) -> Option<&'static CStr> {
>          None
>      }
> --
> 2.46.0
>=20

