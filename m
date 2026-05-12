Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D61A3AFB1C;
	Tue, 12 May 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596122; cv=none; b=br5vo+xO+0X4ITSY2fjvmzNCMC1tQU7rpig33+aAMb4NROFKosSv9IRT4+9aP/dRZbeEjjxoawrfnNkaIoBVBgYRHaHU6CvvvYmVUcDegQmU1pVAju/xKbsF1hbqm3xYUXqwPeo61w8EvAn68UzuGAxCWHIcl3NYlrjG+Urcqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596122; c=relaxed/simple;
	bh=o+TboBwAqLXtPXuFMTp44OX+63gXjTCtx3maVbI2zbs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=jRvUi4FN3rbF3ZV+aGtwlZnGqA4LC3Qu4oHliNRN9pA4CTht9I6aZnbnulHwOKQQgBD10u/cW4zFoYd7dv028lFpVtWdb6lDpMQNjy8svZwdbntgfEQHGZeXBoRWnQSfglYHgGMjlyRFfbveT99BZlCgxLnLq4NQ3OB7HJVEu4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STrInIP9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STrInIP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CBBC2BCB0;
	Tue, 12 May 2026 14:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778596122;
	bh=o+TboBwAqLXtPXuFMTp44OX+63gXjTCtx3maVbI2zbs=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=STrInIP99LeHEIA4eX/QgTD2S5DNZOk1rHsXu7RR6PmB4fDHyeXTGlhMEsVZBAvty
	 hfoJZT54x4w7kiARHdjkyP8is/lh8Sqob1sK5sAZtkgV9TNtFgPxjN2JfCY+Bnjf9H
	 y1W7qBgLN9aA3KM9rDMeVBB+nPlHASw+0CGYIToApNyhMfXL4qo1NWZ4G9pb5M0F1f
	 9arLvs7TwTQniSH3jaiyfabCizp0DzdHszbXCkO1VJPeZ3Opn1fECD4nrlrbdgSeBb
	 cxt1NzMkrvh8FMwWEaL4ykNO4IGFrwajCM/CSroRSQC2OFxEaH2sP+RMtKC9AIp1Rr
	 YVwFEI+8qYTew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 16:28:37 +0200
Message-Id: <DIGRPCOV5K8K.9S45JQA92MMN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] rust: alloc: cleanup imports and use "kernel
 vertical" style
Cc: <ljs@kernel.org>, <vbabka@kernel.org>, <Liam.Howlett@oracle.com>,
 <urezki@gmail.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260511214154.3569305-1-dakr@kernel.org>
 <DIGQSPXOI9ST.3R3JHV2N5UNML@nvidia.com>
In-Reply-To: <DIGQSPXOI9ST.3R3JHV2N5UNML@nvidia.com>

On Tue May 12, 2026 at 3:46 PM CEST, Eliot Courtney wrote:
> On Tue May 12, 2026 at 6:41 AM JST, Danilo Krummrich wrote:
>> Change all imports in the alloc module to use the "kernel vertical"
>> import style [1].
>>
>> While at it, drop unnecessary imports covered by prelude::*.
>>
>> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>
> There are some non-vertical style imports in rust/kernel/alloc.rs,
> should those be changed too?

Yes, thanks for catching this, and the one below.

>> --- a/rust/kernel/alloc/kbox.rs
>> +++ b/rust/kernel/alloc/kbox.rs
>> @@ -3,24 +3,46 @@
>>  //! Implementation of [`Box`].
>> =20
>>  #[allow(unused_imports)] // Used in doc comments.
>> -use super::allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter};
>> -use super::{AllocError, Allocator, Flags, NumaNode};
>> -use core::alloc::Layout;
>> -use core::borrow::{Borrow, BorrowMut};
>> -use core::marker::PhantomData;
>> -use core::mem::ManuallyDrop;
>> -use core::mem::MaybeUninit;
>> -use core::ops::{Deref, DerefMut};
>> -use core::pin::Pin;
>> -use core::ptr::NonNull;
>> -use core::result::Result;
>> -
>> -use crate::ffi::c_void;
>> -use crate::fmt;
>> -use crate::init::InPlaceInit;
>> -use crate::page::AsPageIter;
>> -use crate::types::ForeignOwnable;
>> -use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
>> +use super::{
>> +    allocator::{
>> +        KVmalloc,
>> +        Kmalloc,
>> +        Vmalloc,
>> +        VmallocPageIter, //
>> +    },
>> +    AllocError,
>> +    Allocator,
>> +    Flags,
>> +    NumaNode, //
>> +};
>
> This changes the scope of `allow(unused_imports)`. Is this intentional?
>
> Both nits so:
>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

