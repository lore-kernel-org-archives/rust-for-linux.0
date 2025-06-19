Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5F2472A6
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339056; cv=none; b=NNWLx0iOBnH+uiAPHBDDU8wUMIYmy9ca9UovFhPVeo9nEIwuDGouaZRV/VhPqnYxIe4dTkjNX76xbxOInX4o2uJW7DnV6zEzjLlQcmkngkz5iYHNbac/SHu1OpqB6YYjhsUhpZn6EA/9CZbeBiUiTeMmFMn/HHnL1Jyt2cBuLvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339056; c=relaxed/simple;
	bh=c2E3iqwtJvWel7zGv2Rkd8QZeSAwVWBNqMuO8Ypqgbk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ONj7yhI4kzhw68Li9ARec9NEx16vjH4jbK6jJFhK8eC83Hk2fRfs0pnZk12YPydp4/5buy4JmMnDecFYNRh/pZGy1dqryIULJzV0Z7ZLWTiQVtpLxgl0MrllvcVRC+4s3BPITRNMZxWt9rnsGe6cUhwnfJuzp8K8rqN/rPqjhSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqWIl7Ui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqWIl7Ui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20516C4CEF9;
	Thu, 19 Jun 2025 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750339056;
	bh=c2E3iqwtJvWel7zGv2Rkd8QZeSAwVWBNqMuO8Ypqgbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqWIl7Ui2f9PfoGFnlRECL5UBz3jsK02cR9Iyx0tHSUb7w+9SQ0hEXtKqcvVCxJha
	 Em1swrU2q9N+m20xaH03XT32lVstljh60Py2hXsRb6IlpV9BAKzcVEUxv68jEiZo3J
	 wwhnVpN1HRf8rTf5I8uZHBirWazU4rKFpaBd+eBoT47ea1ocxCFRhzYqs5n7QgJIBS
	 a/DuHKsxi8KswMEg+CLug9YV4vZWj+mvxayynpJJAt1eQF3aAA3Gki/AUFi5ExOJwR
	 zNNzI/e8lBN1afOG4Pbx4RD6RE/DBWF63g6RVqM1q/S1fqA/fvuj3OJZaz+I+eeIzC
	 0yA0vcGyApVHQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 15:17:31 +0200
Message-Id: <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Beata Michalska"
 <beata.michalska@arm.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <aliceryhl@google.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <alyssa@rosenzweig.io>, <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
X-Mailer: aerc 0.20.1
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
In-Reply-To: <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>

On Thu Jun 19, 2025 at 2:26 PM CEST, Daniel Almeida wrote:
> Hi Benno,
>
>> On 19 Jun 2025, at 08:01, Benno Lossin <lossin@kernel.org> wrote:
>>=20
>> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
>>> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
>>>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
>>>> index 445639404fb7..12b296131672 100644
>>>> --- a/rust/kernel/drm/ioctl.rs
>>>> +++ b/rust/kernel/drm/ioctl.rs
>>>> @@ -139,7 +139,7 @@ pub mod internal {
>>>>                             // asserted above matches the size of this=
 type, and all bit patterns of
>>>>                             // UAPI structs must be valid.
>>>>                             let data =3D unsafe {
>>>> -                                &*(raw_data as *const $crate::types::=
Opaque<$crate::uapi::$struct>)
>>>> +                                &mut *(raw_data as *mut $crate::uapi:=
:$struct)
>>>=20
>>> I think we have to document the guarantees we rely on to create this mu=
table
>>> reference.
>>=20
>> If the C side is using pointers to read/write the value concurrently,
>> this is wrong, it needs to be wrapped in Opaque.
>>=20
>> ---
>> Cheers,
>> Benno
>
> How can this happen, exactly? Can you provide an example that corroborate=
s it?

I don't have the context on this, I only saw a raw pointer being turned
into a mutable reference and that's only possible if there are no shared
or other exclusive references for the duration of its existence and no
raw pointers are being used to access the value.

---
Cheers,
Benno

> The general pattern for drivers is to fill an uapi type and then wait on =
an
> ioctl. The kernel then copies that using copy_from_user, so we're safe fr=
om
> that perspective (i.e.: from the perspective of concurrent access from
> userspace).
>
> In kernelspace, we usually extract arguments from the uapi types to then
> dictate further processing inside drivers. In what way are these shared w=
ith
> "the C side" ?
>
> If the result of this discussion is that we agree that this Opaque is not
> needed, then we definitely need this patch, because using Opaque<T> compl=
icates
> all ioctls implementations by making it harder to get to the inner T in t=
he
> first place. We would have to needlessly add a lot of unsafe blocks for d=
rivers
> that wouldn't otherwise be there.
>
>
> -- Daniel

