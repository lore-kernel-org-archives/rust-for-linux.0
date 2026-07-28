Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE613B3890
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 06:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218828; cv=none; b=oRCF5/yrA2uBNGm/UzXWsxmijtPytURV8jutcRbxDcz93vjkhhiycq+QPSY6pzOpy7r3WQa9scaz5Z0kG9phx6Qvsv506R6Q6xpPZ16/SOGhoBd+IwSjGgddEgu/FyHkT4Upk9dnPXN+nczRTIpEinxAQn3HoOeoXM8jH8fphSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218828; c=relaxed/simple;
	bh=+B8FC08ruk6uHcR1gUlV/VZ9k2iLEMEnuFg2IYWZXOQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Onfnbb7zN7OpyiKoR2H5vcve9OgEe3QciVO+WUFmoONwjLzPZSKdBQYPNIS1t1YIDODrcd/qzcLBRObuoprL7PJQZ70WKoxfrFGKbjC3fel2ugPaknSwwCFtyoaYg15Rk15e5CFV3L4EPa6CCx334O88596evSwzdvGYDFWnAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K7YjGpi9; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K7YjGpi9"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4729d2a64efso314298f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 23:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785218825; x=1785823625; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2UoWS7W3j9jGreddiLikSRyuNRkM+oT3QIl1sX7WXQ=;
        b=K7YjGpi9rVYRLdEsJqmdLCm5wthCYXBj6I+8Z+ydOUeWoSprqti/3WhYMHb+UOs71Y
         oXS4HcAZQKoSvOos75/vOLZIuxoQqMngVuHHeKoGwN+Ee0m77rAoHHLv9qm9UYUm8yQ0
         FpJ3u0LAGmR+42h7tQAPOGj1XZzHKAFJbl4jvi/EYR6oSyV4/HCiNBqj8/AJSAOmoG/Z
         8i8JGy3HgvFHFp+kXGt3QMXsGlYpusqFCFcbYsOFbDGKMCYDoLFfvQOrpmjo8DqVwj0h
         RguT0lJCHMKzSEnnXUg/T81HD+seJv44X7VKYAw89AmojrMtcsT0JZFRPj9O7xGKVYGb
         fwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218825; x=1785823625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2UoWS7W3j9jGreddiLikSRyuNRkM+oT3QIl1sX7WXQ=;
        b=tQguHDPVTAqGtGBYjjqr9iZO2tbmQdMnMcFK8obgM6Pu8+pwfDOlOe4zCGm2StTIq+
         p8Ai07wzmUEoFMni8Kw8hS4ioOq4KM5l7Xwud6MyJ0EtgleADfW8FMouFfPvNMvPBaKG
         /v4gWE4vpPXB6ikGMqYugZokG6tLzLrPE2ldG7t0Oz7qqW6LzpWT+Hi1gsRJCTAlmhqa
         nS53SPxo8t3LgI4BJZZU17lHL07hejdTOBn0ji6vn3o9F1WrT0lqEduHX5NCXqYV7vBy
         cukDuV35VJAbJPC1ZToaFsmnvDd37oCNNe+CU3/E6G4B/t0J/j+JMy3DqXa6SupaGnYB
         WnDw==
X-Gm-Message-State: AOJu0YxgMGqxmW+LVd0l+5xi/MBr1sDjaBugjeoIT7HpXg2ooVHJSuZw
	wuGYZCGppk8YWR2fAVkdGOy8IhZNzLwmXLTVBGBu5IAM7rSc3p/WR+OOWE3laOp1TkTIO3yi0g2
	3L2pntnMqwJq24P1rzw==
X-Received: from wmju5.prod.google.com ([2002:a7b:cb05:0:b0:493:c2c8:a251])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f95:b0:495:4f84:7280 with SMTP id 5b1f17b1804b1-496c641fe08mr8629185e9.4.1785218824571;
 Mon, 27 Jul 2026 23:07:04 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:07:03 +0000
In-Reply-To: <20260728012249.3084154-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728012249.3084154-1-rafael@rcpassos.me>
Message-ID: <amhHBxSfuat8WZ8R@google.com>
Subject: Re: [PATCH] rust_binder: speed up get_node_debug_info using
 lower_bound iter
From: Alice Ryhl <aliceryhl@google.com>
To: Rafael Passos <rafael@rcpassos.me>
Cc: rust-for-linux@vger.kernel.org, gregkh@linuxfoundation.org, 
	arve@android.com, tkjos@android.com, Christian Brauner <brauner@kernel.org>, 
	cmllamas@google.com
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 27, 2026 at 10:22:18PM -0300, Rafael Passos wrote:
> Finding the next node in the RBTree can be done more efficiently using
> the cursor_lower_bound, as it reduces cost from O(n) to O(log n).
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1249
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
> ---
> 
> (Sorry for the resend, my script missed the list)
> 
> Hi, I decided to use the peek_next semantic instead of a loop/break.
> Since the iterator should land directly on ptr or greater, I think this
> is more elegant this way. But I can change it otherwise.
> 
> Thanks,
> Rafael
> 
> 
>  drivers/android/binder/process.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index cdd1a90797266..c0c2112aca1c6 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1174,10 +1174,15 @@ fn get_node_debug_info(&self, data: UserSlice) -> Result {
>  
>          {
>              let inner = self.inner.lock();
> -            for (node_ptr, node) in &inner.nodes {
> +            let cursor = inner.nodes.cursor_lower_bound(&ptr);
> +            if let Some(c) = cursor {
> +                let (node_ptr, node) = c.current();
>                  if *node_ptr > ptr {
>                      node.populate_debug_info(&mut out, &inner);
> -                    break;
> +                } else if *node_ptr == ptr {
> +                    if let Some((_, next_node)) = c.peek_next() {
> +                        next_node.populate_debug_info(&mut out, &inner);
> +                    }
>                  }
>              }
>          }
> -- 
> 2.53.0
> 

This would be a lot simpler if you just did `cursor_lower_bound(ptr+1)`
so that you go straight to the right target node, instead of doing this
if/else logic.

Alice
