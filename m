Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6236654A
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918833; cv=none; b=SUeNaIKjoOsTWrlUokBQ3lg1zChhAS53cKA71j/6+d0cF5sGpLB+IC8r9/F8Pecn84Q53CIFgHBTlRmMEtSbRj3r9DU2qd/4PIsOqDO5gXi27o1GpK4BLDsU6wbEoCfCDoOVqy/54j4gbamrtAY0y5HNreqfsh1jbivohy0VacU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918833; c=relaxed/simple;
	bh=Io/ZkhGhEupZ5ffQQcXAaXbykfDp3iGhw1Kf+6gZPuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aTSVrGMC4ZHH/TuQrGbMQCKe150/GM1cwZeEUauN7dxramemAIIysox0YbcUQAReMgXDgAOm5V6D37cZVqBlNaj/jMRJLPF4cZnJkGW109+4+K1Z5i15l+OKmslGfFgDWN0uAlNXr01tQ2KmH3aMHi4DIBCtDJJ+KP3xH+pt5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dEx7j/+8; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dEx7j/+8"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65f6e28e7dcso243786a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 23:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771918830; x=1772523630; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sCYKSjqgDVMvOWcwfRLj9JJfMnbz5kYU9ZhocRMksgo=;
        b=dEx7j/+8sPPS3JuRwv7oc0I4qJ0d2VKbLf5bDBwns7FyOPoJNnHhpLFumS/uZ7cHPJ
         /c5MFac2J9rdLjh1WkV3wgcBExsW+rN5b31R+L/poxCLYZvaHKITbN28YAcxOSeHeOgS
         77mM9zBCeMXWapcVsOsXDCkv1Aw1juiSa2Wt1mhXxnqW+RorkhXc1TVgfNcEjU+99d+6
         CIcBXNqqXqjXORahBOd6kmICOEQIst2IYWSMLOfwVkoMikEtETcsSXB6KKYFSPjwcQeI
         uqylgG5kZ0JFTCKApbycvMA8VrzQKaBHAymnPpkIzb+9y9CULzGOTH6kAzkcjDNnrf6J
         y44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918830; x=1772523630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCYKSjqgDVMvOWcwfRLj9JJfMnbz5kYU9ZhocRMksgo=;
        b=KYPn4hvBxUFbK2VRGl8EenPrWeWawRJCL+K6CNLldYleQYiO+vrKQtFSP3ZWMn65RC
         22n10dKBDkv7UxHE1HhuNLxIf67jWQZs9ZBZZC8NXt0oCqaFJJEyRoV7CVo8Oxr6ekZO
         5otzn7d9FLg29KXhWuzbvz/+V6n/pzRRpOnpTURSKW/cV/ROioacJ4T+lzIYqaY17rlk
         7dIGHK6oMYzg9c54yyFvCDq/+oqf0jMLvDIN31rItOjmKsF0evAGpdFxe0Oy/sU/3Xmm
         qOcYQYVtGtqAE9neTaGSSkjXF4Qz01VCGXvO1mkmfqNX+JNn+NSAkYvnbU8AhXiLUQ/R
         W62A==
X-Forwarded-Encrypted: i=1; AJvYcCVlDVfFHr4OE2oCmiYsUFeoij18J/5Xmw/wFjmBwZiLwO5kom+H7y3X/qMnsoWunySumbEEeNT0jMiCweH00Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8K9LVZ/o/n/xLvoe5xpqvELpo7GJCYygn2IQQdBmPSmLwpEj
	9ZvR6XGw59f+GZHBA/sWA9N2A4k/0QkbCLjAlYbDyvlRbCgOz9QGjnDhdIDSUdDnnUsaGn2oV03
	3iHV4A6osoqqEBGuf9g==
X-Received: from edwv1.prod.google.com ([2002:aa7:cd41:0:b0:65b:963c:ec65])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:354b:b0:65b:94e0:a593 with SMTP id 4fb4d7f45d1cf-65ea4b65b5cmr5810901a12.1.1771918830281;
 Mon, 23 Feb 2026 23:40:30 -0800 (PST)
Date: Tue, 24 Feb 2026 07:40:29 +0000
In-Reply-To: <20260224-nullterminatedformatter-v1-1-5bef7b9b3d4c@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-nullterminatedformatter-v1-1-5bef7b9b3d4c@nvidia.com>
Message-ID: <aZ1V7ckM97JvSZKt@google.com>
Subject: Re: [PATCH] rust: str: make NullTerminatedFormatter public
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 24, 2026 at 11:25:34AM +0900, Alexandre Courbot wrote:
> If `CONFIG_BLOCK` is disabled, the following warnings are displayed
> during build:
> 
>   warning: struct `NullTerminatedFormatter` is never constructed
>     --> ../rust/kernel/str.rs:667:19
>       |
>   667 | pub(crate) struct NullTerminatedFormatter<'a> {
>       |                   ^^^^^^^^^^^^^^^^^^^^^^^
>       |
>       = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
> 
>   warning: associated function `new` is never used
>     --> ../rust/kernel/str.rs:673:19
>       |
>   671 | impl<'a> NullTerminatedFormatter<'a> {
>       | ------------------------------------ associated function in this implementation
>   672 |     /// Create a new [`Self`] instance.
>   673 |     pub(crate) fn new(buffer: &'a mut [u8]) -> Option<NullTerminatedFormatter<'a>> {
> 
> Fix them by making `NullTerminatedFormatter` public, as it could be
> useful for drivers anyway.
> 
> Fixes: cdde7a1951ff ("rust: str: introduce `NullTerminatedFormatter`")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
