Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF7F286D7E
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769419389; cv=none; b=nzfLyXhXyyQtogCpse2aoSooZcC2gZSa12kg82RdrKpVXajAQkKUBprFcnbG/tVMnh2+i+ZN7OaMyvcp4eOFj5bBvrRRXBRJ1e18zV5jdT0kjzq5K+70TJOrettZ66285Pq2ocUjIb+mGEB/V/VebF+Y68iIs6O8ps0ndI+rg9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769419389; c=relaxed/simple;
	bh=fJJa1U+5LO/W0O0OgRsjCnFbKZTzxAJaRMD6RnLQR0M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KsZBmSIpIYlwhpS203agPKHo1+PatLxw/vk+3QAtmMSIyWTAUQ8OK0IItgLgy2QJunHhu4sMRHUPlWsg5VJgcHgBxAurhfoMtGM0HpsVMgrCMd2Zghxllx3XQf4DE8R1+K9X0JCcxKVpsduPkludiTGR++NlStgToI/BoLbCBAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CIcZOO5p; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CIcZOO5p"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d62cc05daso41356765e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 01:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419386; x=1770024186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXmAJJ4iPhpnn3ayr47ZnzL7rMFN7Y6UaCo6pNdm/ZA=;
        b=CIcZOO5pT9RfAFDig4mBlMcIhwbadUT9kR+Rzfn3VcKRrc9w5JMwU5nVcpe9pL8r0K
         n7SNc+/OZHH9VVRf+svhaRcS6d3H9Vzz5pue9hLZJ3yizuAodQO4tG9dhj+7T+7AqUMj
         yW9PaX14ktvKfHqO7Up70KJBAueU1/wp2CcFX920leBkGCjwvdHYbYLf5YPHA3oQYrbg
         +ZAmmtJOGFJyRTtMk1IJOdfY8vOdlTiCGx4ksIteDJ6MWrk8pKlYU9N4NAnAhRd7MHVf
         5whOCmNi+fdYF7QBZPXbl6jCx4mp05hw3P70AhPZ2WBc6+H/ghsAPc+Cl0Qkuq7TEmw7
         kuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419386; x=1770024186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXmAJJ4iPhpnn3ayr47ZnzL7rMFN7Y6UaCo6pNdm/ZA=;
        b=MtGXofrhzhiimLsNpCcEkfNmBJ5NoF6GLkUwuUSs84/b5FWZoTTR+59hLega6FTYaW
         li3jmHEUp1G53tIHpGmfQHus8L00fTV1eTilnmwhlQL0glpjXOB3JjAZg8KYLM4Ki/Yk
         /Zc82qyCsfrcx7i6XS67Jvb54MCTt7A4kXglErWCJlN7dSqWMD4BSYMIoKeAOQQwsM3U
         H7p4XMm2YmO0WPTrgLc9XkowtKIzMCBsVNA2DqeKb/nZuu+BGVECAOyk1TikfBLWCaVd
         tZjXjEJtCTyblkjUosO3GjHZvp1oTEkgW8CFuVEZQpQf5+H883ByaFqLN73qVbxKm1Sa
         OZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx48rlKtxqdFSHWQPqxklfh6FtwzwRkLcGfkliNCeSechE7FxCUz7bkGFfCe455IwNeqzRM2zPSv6S1MfsFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk6lBdpfK+EIQNDtJFtTYTrw2xHZ1DgrQmlaYV3R815HsVodUJ
	/ogLobNOtxstOEdTJ4tbc+YmXukE4JVu7XvkqNyCzzgCIrsSpusEVtliLUbY0ciAVMbzmMJ4Iid
	C9m9ytaW7o4Wxx3Qo1w==
X-Received: from wmcu9.prod.google.com ([2002:a7b:c049:0:b0:47a:9289:c5d8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b86:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-4805cf67245mr64031285e9.20.1769419386050;
 Mon, 26 Jan 2026 01:23:06 -0800 (PST)
Date: Mon, 26 Jan 2026 09:23:05 +0000
In-Reply-To: <20260123172007.136873-4-gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net> <20260123172007.136873-4-gary@garyguo.net>
Message-ID: <aXcyeUi7a1tcTyCK@google.com>
Subject: Re: [PATCH 3/3] samples: rust: remove imports available via prelude
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jan 23, 2026 at 05:19:42PM +0000, Gary Guo wrote:
> These imports are already in scope by importing `kernel::prelude::*` and
> does not need to be imported separately.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

