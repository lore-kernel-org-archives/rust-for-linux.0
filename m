Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F76126F0A;
	Sat,  3 Jan 2026 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767435301; cv=none; b=PS2ogMSYBeUHXbMFSkxTu4Zw2B59Yijfw2KeVFiqRfbNEa5iuCu7re01O9aIuLguEjOMfsDtHeFSHE0G+bd9i4cwf4wSeATBRfVn3kCK+T3LEhExLlVLYTFtfhJacfCTPpbsXjqXqWh9Ulf+rKwQz1NnM4dw12L+TF9OjTHwgoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767435301; c=relaxed/simple;
	bh=VJPG6cAxntp719Jx+yOECXPqz1CSvBhPq9ajb2tyTX4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qwydk5VFiRxyvsZNtKRg623hbdlzG7PzkU274+833W9RlfcwmbuYmLwQMf7PSHzjjaWjFq2co5g45ucbXDvh0g04CKK24Zz0AL7f4dlV2I3IAYCbG74QEYDAsy+adpKhQSO/vzFWATH+0vnnwamV/vBs0/M3mKKW9ioQA9jziaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8SBg0g4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8SBg0g4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D351AC113D0;
	Sat,  3 Jan 2026 10:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767435300;
	bh=VJPG6cAxntp719Jx+yOECXPqz1CSvBhPq9ajb2tyTX4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=q8SBg0g495DLKSAVqjx4MtrtLI/KWiCvW4GWkdFlpUw+/KIF7qSVpRVDR62wiZOJp
	 BlTgbdL/SAc88Bjz+53B3bzv9S+iRBg4Z/K14olgFfTnZ/fV2UWGTQDd7i92+CK9fQ
	 t4lJxSoqZ1ue0A0dey4+5+O0sc78U4lJ9xNYqE7XoFUkeFknWE2i/MpGoozjoAQU1V
	 akGoUm+0QeSU2kDSfmyILZx2Vgmmhb3e0AdFzs3hUUAnGxzdbmxhbcPYsL/5SyJUny
	 g5mW3D9LQzzyWchTzZ2ccldRVzF5yac7YIzjhioffJ2YaAiRu+GVTA6Z2ryXr0cXTY
	 k7LfN5J1ztzAQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Jan 2026 11:14:55 +0100
Message-Id: <DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org>
Subject: Re: [PATCH v2 09/10] gpu: nova-core: simplify
 str_from_null_terminated
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-9-dc7b42586c04@nvidia.com>
 <9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com>
In-Reply-To: <9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com>

On Sat Jan 3, 2026 at 4:37 AM CET, John Hubbard wrote:
> On 12/15/25 8:27 PM, Alexandre Courbot wrote:
>> The core library's `CStr` has a `from_bytes_until_nul` method that we
>> can leverage to simplify this function.
>>=20
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/util.rs | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.=
rs
>> index 8b2a4b99c55b..2cccbce78c14 100644
>> --- a/drivers/gpu/nova-core/util.rs
>> +++ b/drivers/gpu/nova-core/util.rs
>> @@ -2,15 +2,10 @@
>> =20
>>  /// Converts a null-terminated byte slice to a string, or `None` if the=
 array does not
>>  /// contains any null byte or contains invalid characters.
>> -///
>> -/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null byte=
 can be anywhere in the
>> -/// slice, and not only in the last position.
>>  pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
>>      use core::ffi::CStr;
>> =20
>> -    bytes
>> -        .iter()
>> -        .position(|&b| b =3D=3D 0)
>> -        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=3Dnull=
_pos]).ok())
>> +    CStr::from_bytes_until_nul(bytes)
>> +        .ok()
>
> I guess I should have reviewed this patch, before creating my version of =
this.
> I went so far as to delete this file entirely, see if you prefer that, it=
's
> otherwise the same core idea, but with more cleanup. [1]
>
> [1] https://lore.kernel.org/20260103013438.247759-1-jhubbard@nvidia.com

Yes, let's remove str_from_null_terminated() entirely.

>>          .and_then(|cstr| cstr.to_str().ok())

Additionally, why do we return an Option here? While an error can only ever=
 happen if
the given slice does not contain any NULL byte, I don't see why we discard =
the
error code.
