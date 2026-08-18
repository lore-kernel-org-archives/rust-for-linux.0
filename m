Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A260746E00B;
	Tue, 18 Aug 2026 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787055906; cv=none; b=XDlTob39teDK/jIjfSfSAcSqFs2MfR/1SN08M8j8QgMIskmnKstXJ3xtBP7Q0GVnwPT9ZayGidDOMNtoE6Jwl1gKMWhRNvfJz6KdcssXICEdoBaTDHXzwMnz76PCEZ+EZSP8TSJmJd1Sc7tiwGLZzEVoZEPGzrOtUshiCPkk60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787055906; c=relaxed/simple;
	bh=WjQKNQYWeJjNUgod6Frcm/Yb18L9+Sq4jIQzkGAa4V8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j3MZp4Be7RT8vkaV7Vz4PLtJoX+9ars6yKNGeUCdB6eGKvTsCkxp38Yz1wCxRi8Czg0nc8uZrPo67VOCaqhpwl3UCipScA2UNgAHuqOdG7Hj7nqxH5SryNTxpz0kd3E/8sO6d6k2J/BD051u6sYQS4Q64hsbZ85XpL1XNhBLzR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhuVbyn+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhuVbyn+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6301F000E9;
	Tue, 18 Aug 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787055897;
	bh=IHXFSLVp4g9rSlWOugyNrAlLV77nVF0ySTm53kW1V7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WhuVbyn+7ehfnUbFACA9S8U+OYILhx0hQqW2aM1dj+B/NP+k6rCRjicgxmnlKnWsO
	 7+3JEvOuZdXZm6+ZdAjTak0KKLjjh3ZVVO65mnJ0JNoPUYPwmUJ3prpUmMkCvTScFJ
	 ayVobV8AW38g9TO2RXRrAD4hlXWuY8YpYK3syYIMKp+A8iZTScK/60Q/WqaTrWLosb
	 CP2GKAgYyRkiD50RQFeBSyNPf/ndj50GQyOFnSZcm+ArDl9+pkXukWSrERBIQnqEU/
	 r4UxwizHzPm81FpfgBeqXbCkGKe0GxT4kFFAV0a0/5hJ5u3D974VMUjy3jzSE8acRE
	 2Sjxz09gSCMKg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, git@younes.io,
 Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: configfs: skip unregister after failed registration
In-Reply-To: <DKS0NGIDGCIT.2N03Y8VZ7Q6B@garyguo.net>
References: <20260818-fix-rust-configfs-registration-state-v1-v1-1-c929990bc8ef@younes.io>
 <I9rMOFpWPbtlAmMsBCz7tH-ltTS1GDo5t-PVCCUa9X9MdkjjRkiRVlW1LO4wrbypD2fR3D80NozC8OdUxVBQ7A==@protonmail.internalid>
 <DKS0EN4DLKW3.IB8Z5VB3B7YG@garyguo.net>
 <87tsor8zty.fsf@t14s.mail-host-address-is-not-set>
 <DKS0NGIDGCIT.2N03Y8VZ7Q6B@garyguo.net>
Date: Tue, 18 Aug 2026 14:24:48 +0200
Message-ID: <87mruj8vlb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Aug 18, 2026 at 11:53 AM BST, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Tue Aug 18, 2026 at 9:11 AM BST, Younes Akhouayri via B4 Relay wrote:
>>>> From: Younes Akhouayri <git@younes.io>
>>>>
>>>> Subsystem::new() calls configfs_register_subsystem() from a fallible
>>>> pin_chain callback. If registration fails, ChainPinInit drops the
>>>> already initialized Subsystem. Its PinnedDrop currently calls
>>>> configfs_unregister_subsystem() unconditionally.
>>>>
>>>> configfs_unregister_subsystem() requires registration to have completed
>>>> and immediately dereferences the subsystem dentry. Registering a
>>>> duplicate subsystem name returns -EEXIST before installing that dentry,
>>>> so the cleanup path dereferences NULL and panics the kernel.
>>>>
>>>> Track successful registration explicitly and only unregister in that
>>>> state. Keep mutex destruction unconditional because it is initialized
>>>> before registration.
>>>>
>>>> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
>>>> Signed-off-by: Younes Akhouayri <git@younes.io>
>>>> ---
>>>>  rust/kernel/configfs.rs | 14 ++++++++++----
>>>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
>>>> index cd082b83e9e7..f358e227ce09 100644
>>>> --- a/rust/kernel/configfs.rs
>>>> +++ b/rust/kernel/configfs.rs
>>>> @@ -130,6 +130,7 @@ pub struct Subsystem<Data> {
>>>>      subsystem: Opaque<bindings::configfs_subsystem>,
>>>>      #[pin]
>>>>      data: Data,
>>>> +    registered: bool,
>>>
>>> No flag just for destruction. Please change new logic to avoid needing this.
>>
>> I guess we can have a local `UnregisteredSubsystem` that we can
>> cast to a `Subsystem` once registration succeeds. Is that what you have
>> in mind?
>
> You can use the arbitrary code block feature of pin-init to run code before
> arming the destructor:
>
>     _: {
>         let result = crate::error::to_result(
>             unsafe { bindings::configfs_register_subsystem(subsystem.get()) }
>         );
>         if let Err(err) = result {
>             unsafe { bindings::mutex_destroy(&raw mut (*subsystem.get()).su_mutex) };
>         }
>         result?
>     }

Neat, I did not know about that.

>
> That said, why is the configfs not initializer the mutex, but rather users do?

That is just the way configfs expects users to use the API. C users can
initialize statically as well by assigning the mutex at declaration
time. Try to grep for `init.*su_mutex` at kernel root.

Best regards,
Andreas Hindborg


