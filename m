Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF87313535
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 08:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970839; cv=none; b=qM3pItEuKsCmbbcq7X0aimCsd4EhfQukejwsUOH8j7JlzG4V+vCyvziWdLv9hSqsSjG5s8Rta1PLeyWdtZyqlBxW5E+iUKzIAC3IWZ70n/X7ln6v1LWc5MafJId58RKL2pWc0mqEdf/NbkNiXiiS+1SRHHDKnYVSGF7uFAq46BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970839; c=relaxed/simple;
	bh=6VyxhO7wz5zqmdtbBObyeJEMr+6VvbQ5EJFXiUdNjMg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FiUHk4Ojz1R0tL2zbrO3i8jsoLVmzXLP+7HX/OOpw1VgW8XpZ9DKaDGh8zi6lA6QA/0pPzKtJVkDytPG3volrtZieoJDzJ3MNXlM1Rk90t8KhgQUWDyDRikd1O663lD5+rryUQCXJ0XSK73kX/Vh3ax6wUM2JbC66T60UesukKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u6eCvTgs; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u6eCvTgs"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8704795d25so47288066b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 00:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770970836; x=1771575636; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OP9HItSUyt7aKYpexkmYnvlxWsHOkfcAmcdFDm5om3c=;
        b=u6eCvTgsa5PPlj5mJVa62BSaOWja+uKln9VHNYOYjuYe/+WN+5JZW83C7b4oi+39CZ
         y05jEWC6WBFal8NSNsGAaGPbfOZU+U4xwV2BSWvhtZg9bFiJjaY9KyCZ/ZINPZroAM2K
         nkTS+eb0Nnaj2Md6N7gl6i4VRUeJ46rd0beqntkt8X1bxe5X+b8/JgNHFlMKWYjwPk0M
         Uj7XhVeW5LaHZiSxsKuqxgwUghzAj64kQwslUQUvf901C4+ZKuHC2uZlXt85+LUv2kVH
         AA5g69yviPvTd3JoHU95AVySVVkOM9c/1/H7sf/FUqJx+FhZ4lCtVD2gxd7fXp35gAok
         rbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970836; x=1771575636;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OP9HItSUyt7aKYpexkmYnvlxWsHOkfcAmcdFDm5om3c=;
        b=baa2TKqo9aVtEaeUTBngtCIJ2hYBu2VE3nl1eMSkDZ7sFF559y+w5vb4d1kW3K4eID
         lRaXfmTzWU4Bp9xW05zXIHDyvnhjAmJNSici1vsINI1YKwSuQWTB5ptsdUV/y8DFbvDS
         6weibmVlcxF17xj+LZMMGHwIvR+UQhbLWAZUseT1pTU02bYQ24robq1p/vpY3Wc8XLYF
         E4TZLMtEsB07wmvZjHmN8rptPKh2LdL7d5dT8gbpdaEyVtlXfuJFMgtCTCBIPt3SOfhb
         6HmNdWiW6DL0PB3esFb5P9zNv9vsLuG3/ZGU88uOnoMwXh21c0EYStTKSoNIGOEycqm1
         //3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHZpryvNHkwwVaQH+0ELngHHX/C89Loxipozp8+LkHbA0KrpkhTbvO4Dt93o/8zI8cXYnEyTvtq0fyP4e60A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLEYwi3Fkr25ZEi2V8/A1OITIddg0UVx/WSB5kd5MYVRlXCmD5
	oj3480VFGql12NAoljJyIgr3xJ3/SvWcddFMpbl0gxFVeTulvxM89FN9DpVK5EhtEpWoC9BMdLU
	49ZOC2WjNF0iBz5hXPA==
X-Received: from ejbgc5.prod.google.com ([2002:a17:906:c8c5:b0:b8e:c3c5:de59])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:971a:b0:b8e:99f8:8c4d with SMTP id a640c23a62f3a-b8fb44fb32dmr45211966b.51.1770970835754;
 Fri, 13 Feb 2026 00:20:35 -0800 (PST)
Date: Fri, 13 Feb 2026 08:20:34 +0000
In-Reply-To: <20260212-rust-uid-v1-1-deff4214c766@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212-rust-uid-v1-1-deff4214c766@google.com>
Message-ID: <aY7e0g-6-x1XPSjC@google.com>
Subject: Re: [PATCH] rust: task: clarify comments on task UID accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@google.com>, Carlos Llamas <cmllamas@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 12, 2026 at 07:00:49PM +0100, Jann Horn wrote:
> Linux has separate subjective and objective task credentials, see the
> comment above `struct cred`. Clarify which accessor functions operate on
> which set of credentials.
> 
> Also document that Task::euid() is a very weird operation. You can see how
> weird it is by grepping for task_euid() - binder is its only user.
> Task::euid() obtains the objective effective UID - it looks at the
> credentials of the task for purposes of acting on it as an object, but then
> accesses the effective UID (which the credentials.7 man page describes as
> "[...] used by the kernel to determine the permissions that the process
> will have when accessing shared resources [...]").
> 
> For context:
> Arguably, binder's use of task_euid() is a theoretical security problem,
> which only has no impact on Android because Android has no setuid binaries
> executable by apps.
> commit 29bc22ac5e5b ("binder: use euid from cred instead of using task")
> fixed that by removing that only user of task_euid(), but the fix got
> reverted in commit c21a80ca0684 ("binder: fix test regression due to
> sender_euid change") because some Android test started failing.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  rust/kernel/task.rs | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 49fad6de0674..33e6d44b9a15 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -223,14 +223,17 @@ pub fn pid(&self) -> Pid {
>          unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
>      }
>  
> -    /// Returns the UID of the given task.
> +    /// Returns the objective real UID of the given task.
>      #[inline]
>      pub fn uid(&self) -> Kuid {
>          // SAFETY: It's always safe to call `task_uid` on a valid task.
>          Kuid::from_raw(unsafe { bindings::task_uid(self.as_ptr()) })
>      }
>  
> -    /// Returns the effective UID of the given task.
> +    /// Returns the objective effective UID of the given task.
> +    ///
> +    /// You should probably not be using this; the effective UID is normally
> +    /// only relevant in subjective credentials.
>      #[inline]
>      pub fn euid(&self) -> Kuid {

Should this be renamed if it's a weird operation?

Alice
