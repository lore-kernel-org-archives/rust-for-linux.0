Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554C65FEED
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Jun 2024 08:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719218629; cv=none; b=MdFt/OUHNYEP27sfAQLrSxw6bU0c3FQeVYWB3HL2lSdfFesCdURGA/I3ch+31Q4zrjXNZGo73a1HP2mzaj2S8vxN5GJHnYb+cAlpZ7wmnLjzXblAgkMPnQBwFCcIiS0Hn9N8s3pLXvWbOwyUVldX2u1I8tzF0xnKpK7qHdI1UrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719218629; c=relaxed/simple;
	bh=fXHVD3G4w62BhkUqfzkmP2hT2Hb8iYR9K+kqcqeZ2LI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LFd4Y+kqLZaOmgye792DNJyQEyMeQ+u1derCSRGdGlZJ8+QzFNHWlRODcB2hj3NdWzMnAZp2x1LM9oJoj2RB7sE+8wY27gllfZcH6MDAU/iroTkkPVBWW+pZ/OiDt3Viu+jbJWBn2xPRkaE6YKRQSyXJZa2HO8neAd2nxA4AnrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aOyZE1+G; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aOyZE1+G"
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-52ce324c204so845275e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Jun 2024 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719218622; x=1719823422; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7DImZLITJOUwBPCplCl17cwIdvOncIJOaqDc09+dtO4=;
        b=aOyZE1+GASMqvOvkHHXdgwG5GG5kSv5AuTxzhzQM9AM1wRCOGGtAP0gOzfneSp96yD
         PL/02sQXpi/YKDOmlevOz2B/dXypRgIeb2xB4A0YlA1n3ZJZWKSy1lcYg7ChEllLFn2e
         ZtYnjX/YvOx/eMUCv6pYx0tfaQnRbF4b9fZrAe/F/uya3LEFX/rLImBItikG0OXUSPAC
         I4dXVsnSj9JtGz0v/GvocjVPER/2PShvHs61LDJDKF/x8qa/laRBiBXIQTnyd0sD6HUR
         kYig1IUltqdCp1HVw8ySJemo4WTXCQEEbziXxlcRaQbB61wWz293V1OH4vFP0gwX0HNt
         pxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719218622; x=1719823422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DImZLITJOUwBPCplCl17cwIdvOncIJOaqDc09+dtO4=;
        b=lJx2FkTeooawlGf8j9aqYf2uZM7DOogIZbcmRy98TvcmPcVgYk9HwKmmSbDXVjQsRa
         QHON2wOrw8qAMJ92ZUZn8ubnwLsmKxemED8I3FRLHjmqJGBlgDKuyZwwrVcvMbsBM9tB
         BHpAXQCd0rix9IGanCi2Y73+WRS09lMwQkc4yr7tQPPO/wM2ehiGjmAnLNxv5vrFkhht
         T3RaSJZp+vKZDm0HsPzt4xYpZasFsM72mA01bylMff1rNeFC7Ai2m7T5N9FF6og2Tl/c
         KwOBvkvysmMZTAfTglYOod2jvxxQLYaDdRneRUeXFUkXLD0qPPaswkL66UJzNWG7y+E8
         i47Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhOyaZBwFMF7xboqnyRYhGB/iPbSGh7qtckprXelxbgUY1+NGf7vszsOwWmfb3gk+jTnt/is1pGmQ6IrZQfmOJGsaWqz6jg23UGRpWpTE=
X-Gm-Message-State: AOJu0Yw/bZimd5Nj7FtQS9rbdeuxjj+Yt39k3eM8rZejfSET5XRzY9zF
	zzj6/nIPnoAUHy447csP+0/QBFbdpPThJxp7VzKvXrwKqBuQIYsNAxz2UA3vRpZOJoqBeFF0xP1
	lW7VDUXviY//C5Q==
X-Google-Smtp-Source: AGHT+IFl7qaSAOzizMYkp+fnl41uvHppZeW94zgECtz+BVyjTWEAYbcTEF31TK+qXZBRAu84hM+CxGAORIag4LM=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:2581:b0:51c:47e4:2608 with SMTP
 id 2adb3069b0e04-52ce17fd192mr3392e87.0.1719218622173; Mon, 24 Jun 2024
 01:43:42 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:43:31 +0000
In-Reply-To: <20240624030327.90301-4-ethan.twardy@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240624030327.90301-4-ethan.twardy@gmail.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624084331.2864993-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/4] rust: macros: Enable use from macro_rules!
From: Alice Ryhl <aliceryhl@google.com>
To: ethan.twardy@gmail.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	aswinunni01@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	wedsonaf@gmail.com, yakoyoku@gmail.com
Content-Type: text/plain; charset="utf-8"

Ethan D. Twardy <ethan.twardy@gmail.com> writes:
> According to the rustdoc for the proc_macro crate[1], tokens captured
> from a "macro variable" (e.g. from within macro_rules!) may be delimited
> by invisible tokens and be contained within a proc_macro::Group.
> Previously, this scenario was not handled by macros::paste, which caused
> a proc-macro panic when the corresponding tests are enabled. Enable the
> tests, and handle this case by making macros::paste::concat recursive.

The actual change looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

However, I have a bunch of formatting nits:

> [1]: https://doc.rust-lang.org/stable/proc_macro/enum.Delimiter.html
> 
> Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>

Normally this would be formatted as:

Link: https://doc.rust-lang.org/stable/proc_macro/enum.Delimiter.html [1]
Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>

> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index d8bd34c0ba89..8afed8facb21 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -269,12 +269,26 @@ pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
>  ///
>  /// # Example
>  ///
> -/// ```ignore
> -/// use kernel::macro::paste;
> +/// ```
> +/// # const binder_driver_return_protocol_BR_OK: u32 = 0;
> +/// # const binder_driver_return_protocol_BR_ERROR: u32 = 1;
> +/// # const binder_driver_return_protocol_BR_TRANSACTION: u32 = 2;
> +/// # const binder_driver_return_protocol_BR_REPLY: u32 = 3;
> +/// # const binder_driver_return_protocol_BR_DEAD_REPLY: u32 = 4;
> +/// # const binder_driver_return_protocol_BR_TRANSACTION_COMPLETE: u32 = 5;
> +/// # const binder_driver_return_protocol_BR_INCREFS: u32 = 6;
> +/// # const binder_driver_return_protocol_BR_ACQUIRE: u32 = 7;
> +/// # const binder_driver_return_protocol_BR_RELEASE: u32 = 8;
> +/// # const binder_driver_return_protocol_BR_DECREFS: u32 = 9;
> +/// # const binder_driver_return_protocol_BR_NOOP: u32 = 10;
> +/// # const binder_driver_return_protocol_BR_SPAWN_LOOPER: u32 = 11;
> +/// # const binder_driver_return_protocol_BR_DEAD_BINDER: u32 = 12;
> +/// # const binder_driver_return_protocol_BR_CLEAR_DEATH_NOTIFICATION_DONE: u32 = 13;
> +/// # const binder_driver_return_protocol_BR_FAILED_REPLY: u32 = 14;
>  ///
>  /// macro_rules! pub_no_prefix {
>  ///     ($prefix:ident, $($newname:ident),+) => {

There's a non-hidden empty line between the last constant and
`macro_rules! pub_no_prefix`. You should either hide the empty line or
get rid of it, because it will look weird when the example is rendered.

> -///         paste! {
> +///         kernel::macros::paste! {

Another option would be to keep the import so that the empty line
separates the import from the macro declaration.

>  ///             $(pub(crate) const $newname: u32 = [<$prefix $newname>];)+
>  ///         }
>  ///     };
> @@ -313,13 +327,29 @@ pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream {
>  /// * `lower`: change the identifier to lower case.
>  /// * `upper`: change the identifier to upper case.
>  ///
> -/// ```ignore
> -/// use kernel::macro::paste;
> +/// ```rust
> +/// # const binder_driver_return_protocol_BR_OK: u32 = 0;
> +/// # const binder_driver_return_protocol_BR_ERROR: u32 = 1;
> +/// # const binder_driver_return_protocol_BR_TRANSACTION: u32 = 2;
> +/// # const binder_driver_return_protocol_BR_REPLY: u32 = 3;
> +/// # const binder_driver_return_protocol_BR_DEAD_REPLY: u32 = 4;
> +/// # const binder_driver_return_protocol_BR_TRANSACTION_COMPLETE: u32 = 5;
> +/// # const binder_driver_return_protocol_BR_INCREFS: u32 = 6;
> +/// # const binder_driver_return_protocol_BR_ACQUIRE: u32 = 7;
> +/// # const binder_driver_return_protocol_BR_RELEASE: u32 = 8;
> +/// # const binder_driver_return_protocol_BR_DECREFS: u32 = 9;
> +/// # const binder_driver_return_protocol_BR_NOOP: u32 = 10;
> +/// # const binder_driver_return_protocol_BR_SPAWN_LOOPER: u32 = 11;
> +/// # const binder_driver_return_protocol_BR_DEAD_BINDER: u32 = 12;
> +/// # const binder_driver_return_protocol_BR_CLEAR_DEATH_NOTIFICATION_DONE: u32 = 13;
> +/// # const binder_driver_return_protocol_BR_FAILED_REPLY: u32 = 14;
>  ///
>  /// macro_rules! pub_no_prefix {
>  ///     ($prefix:ident, $($newname:ident),+) => {

Same here.

>  ///         kernel::macros::paste! {
> -///             $(pub(crate) const fn [<$newname:lower:span>]: u32 = [<$prefix $newname:span>];)+
> +///             $(pub(crate) const fn [<$newname:lower:span>]() -> u32 {
> +///             [<$prefix $newname:span>]
> +///             })+

I would probably indent [<$prefix $newname:span>] one more time.

Alice
