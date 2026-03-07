Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B1A235063
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772923835; cv=none; b=MGfdJtiVjYXuwIeyrsC1iCatyR9m/CUIFRu/Fkcxtu7kCcd8w74cM0G6uqDZeFJLmhRFC8u+VZDf9R08fyXN7YNMrq97fXtWAUp+q+P1tSS1PNeRTfqHvQQMCXxT3tA6+D/W/W+PKAKzxb4QHB0qAFHPC1E/uf4reKpC8r0S7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772923835; c=relaxed/simple;
	bh=DR7iCf5iCuY1oxdfXKGg1i5bjdnpv/6wc+i8qgFECKg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pmtP2cTXyiVUQHRmwT3mTZV9sGdpBNsnNdpUSBHJYRkdCuN0Kc+xNuXKs6AlE6PWis8o+xYU1WMogaFrLB4s1r+XVfL5rGiIDlFN+zmrGJP5TsLJs1GxBL1l539r5GI7xZQhfSSl2BOq2H/2ARn3dfiLft0a1Q0A2Olu8MPhevw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c3lp3Sag; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c3lp3Sag"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48529c087f6so16715015e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Mar 2026 14:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772923832; x=1773528632; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J2Ga3PqBJMZ/HRtk4qSHoFPMCGwKdMPoOZIGSkIVk3w=;
        b=c3lp3Sagcksko3ht3N+8zjx9JMpXLtOfz33uofA/RgkOsUlD0uV0RUzA2Bu19qr6E+
         NcYxjWE7OaW6l622558IspFLeo+9oxtzXPu0AYdIm3XThqKbJhcz/VgbvNH4Kg3oW+Sd
         Z8JeXn135QLSUWSdqAhURJjeGxn69kjht2aqiu9Sbw2hyJPkimTfdQtRY9+MdpWYcEAk
         K5wz9KnnqPFyBgIVB95xC5yEwki6n2RLMJyHUcw2yuJSr/7O4oA4KrJNStx5bhHnunCJ
         D6MVy3EdH3wuKA/FQ3gEpDcfz7j/Lgf0/nyQI6xm1COLUX0onVGwgVCXkxbgTqQIC6lR
         /4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923832; x=1773528632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2Ga3PqBJMZ/HRtk4qSHoFPMCGwKdMPoOZIGSkIVk3w=;
        b=MEsovxNkVjedvtB9MBZSsruC/WP9sXD81jN54ERSgWqiX8fpCw2gcZgBlHEJelFXda
         QQzEWzlZcnNZbPUA2smTVupP+njVZQXTlqCBZCJwfV96qY/xBm/MuheoulB7H5xeuAfO
         AyOz3SULryoW5uHANqHTsWt9jj6laxYZQcQYEm3rOZ8+xzJ3qYIi9dXPVFGefOCi6jVM
         aD4S2SypAaOaaGh6ootuHdBscRpz/P/7ikz1IqbWdtsFKtP6PkAd7bs1bpM6/fSW2dzO
         qR6yU0oZYyUwWkT9rB1GLch5PHYpVYfAMbObsbdc28vmD8jc9/5vkht7AVH7v/8Kql/V
         +BEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2m+hCNzgiQcj1TNPjllJh04bK7BAXmyqtNu8Tin/ztYS21qe2aJBjicsOwB+RoJUx4PennHIZOehAxItDig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy41BkHvHFz9QH/HcUQMdQcLjnwTPJFbQF19QdWZ6fAqXxrMxh3
	iXRb/cpt9op7vRlk2S4DeqePza9eoAPZxiqcTAVRjgfnud4tTR6RhoeWtCowEmG0NU7gG9pXGII
	Ufjh2qjU9XIDasFP8QA==
X-Received: from wmdv10.prod.google.com ([2002:a05:600c:12ca:b0:485:2d79:6c74])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37c9:b0:483:612d:7a9a with SMTP id 5b1f17b1804b1-485268bf171mr105914175e9.0.1772923832367;
 Sat, 07 Mar 2026 14:50:32 -0800 (PST)
Date: Sat, 7 Mar 2026 22:50:31 +0000
In-Reply-To: <20260307135941.51353a4f@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260306-binder-netlink-v1-0-daceb5bc83f2@google.com>
 <20260307104131.4c1d0de5@kernel.org> <aayWSuOM59uojtuG@google.com> <20260307135941.51353a4f@kernel.org>
Message-ID: <aayrtyPKOqVGpich@google.com>
Subject: Re: [PATCH 0/4] Rust netlink support + use in Rust Binder
From: Alice Ryhl <aliceryhl@google.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Mar 07, 2026 at 01:59:41PM -0800, Jakub Kicinski wrote:
> On Sat, 7 Mar 2026 21:19:06 +0000 Alice Ryhl wrote:
> > On Sat, Mar 07, 2026 at 10:41:31AM -0800, Jakub Kicinski wrote:
> > > On Fri, 06 Mar 2026 15:12:12 +0000 Alice Ryhl wrote:  
> > > > The C Binder driver exposes messages over netlink when transactions
> > > > fail, so that a userpace daemon can respond to processes with many
> > > > failing transactions.  
> > > 
> > > Ugh, now I regret letting binder use Netlink. Should have seen this
> > > coming :/  
> > 
> > To be honest, I'm not entirely happy with what Binder is using netlink
> > for either, but it is what it is.
> 
> If we're both not happy let's take this opportunity to find a better
> solution?

My understanding is that userspace is already using or looking into
using the netlink uapi that Binder exposes here. I don't know to what
extent; it's not used *that* much yet, but it may still be tricky to
change the uapi at this point.

Alice
