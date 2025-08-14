Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785F288C14
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755159189; cv=none; b=F4q9rvVT2CRfH1pB9zq64W0X3+aSyDu2vinXBkct/VxR5ag7LWRpyDfsjVy16S+PYM2+0qV2pAskVzenLtnxBMkPDLNK+zmFPr4sn6Q+TBpMdggIF+4Zs5VDP7NE4VRSelmQpnb+w9FSaZW875YqOD4sCIyewnRnk2hERfzc+WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755159189; c=relaxed/simple;
	bh=BKeIEPdgx1Yr0aP+47s/5kOZDM0elo0Ce7jkvP34sQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LoMJdF2V/x1w4iRSokNv87bBN59eN3ogVQ8jpn1s8b2wiwH0xQaIq4Ls5ThfsTeC9NPrE0Hb/kXfum7cWhuHTu+tBERHDK8NzK3c35fV9lOqcHqx1ZQBxq2VEEY9X+t4/znBAYDvydHMOO5eG2bjBlD3s5gJWJlQKsLDbAcrYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AkEm5sQz; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AkEm5sQz"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6188b5dbff5so591403a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755159185; x=1755763985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gUVJLjhJjYfPZGYawsfN3qdob23UWt0Rkn4PBgxrSwU=;
        b=AkEm5sQzJGOKq+F2xY49/ijTTW6Na2jfQu/EM0rhVTTk6Fa50trzcZ4hIg71W8KhMN
         5E1Y2bBWpEWPeaLMZg0JaGe+7OKm3yzuXxjUYEFMR5dKOflJTWPmsVBHMLqIAQC978sr
         w1L5SGLI05ZocAWWfi31iV0AbVKrwfhn96tpj09bMdMZJ0DrCJK1HbMbpd8Eau67GPla
         sstVaetvpym38KzI/7pXIxrY/VbF+/9+pCAgh6+RvNkTwGygQHNfKHynhmfeknbx6l9G
         p5Zgu/0lu4LFBGD9KCv2ggCIq94YBUwE84iyx0Jn3IcMoMkODa8L4F+2vf2pj0buZ9iq
         dCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755159185; x=1755763985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUVJLjhJjYfPZGYawsfN3qdob23UWt0Rkn4PBgxrSwU=;
        b=sJHFcd0y7ydY+Iu95EILGw6a9ZG9+xaIqj+IMezXnD+jUSPLXHCKoST0EIfx8TZT7I
         MfFWTPepwC4Uw98GyUXhH1AmeqBvtsGsVJKaoY2Jf0aF/NxbFM8qUO5rYFfdknRZ2UDW
         W22W2AFpcmG1FBBBDs97ot9N97H4yyWQZivOZHA0ksjQhpQMipZHaFpIIdBc4iab0+L0
         W972aQS4b3yYbmsmvzF4wAwxlaV+zt1K/bi3hu+YFrew5/s+YQrXyj17rnwCUupJ1mSS
         r/y3tCzLYAFPfsRiRgfSDz5cDlGJRwcu5qZ7hQ2fBTk2e3EPc13nIiWY2BhwKp2YaFbV
         xxtA==
X-Forwarded-Encrypted: i=1; AJvYcCXBGa09/Ek8ya/65wndUNtglSupp/lVProooOEenlLtk4OmSn7iBuWQv0OzwybNoGYnmy0F8ZTZu1bD2hO9UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4EsLr5WahOVThCV75EAQgsl7yQVTPZ3yJUqKxgv/O63/VAYEw
	w538YnQL7y8qEJkPgXaj4u+96JjiICeL9W8rpzPwNiqxI0HmnLeVXKHUOjapQD282vMN+wU5EeP
	FYPnwb5RN7zFUbSEjwQ==
X-Google-Smtp-Source: AGHT+IGDK25s3mGVbqV4mde9ao+gXJj5qscZZLzoR07Uks9qBQi84mrlQGWiLRHKrTfsHPo8A4vI/B2xpju3rbQ=
X-Received: from ejcso11.prod.google.com ([2002:a17:907:390b:b0:ae3:5480:d3fb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9623:b0:ad8:a329:b490 with SMTP id a640c23a62f3a-afcb97d3e31mr183972366b.23.1755159185217;
 Thu, 14 Aug 2025 01:13:05 -0700 (PDT)
Date: Thu, 14 Aug 2025 08:13:04 +0000
In-Reply-To: <DC1E72OCYMMU.1C1EWX0YPDEOT@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250812130928.11075-1-dakr@kernel.org> <aJw7sx0p0Ec-oLkz@google.com>
 <DC1E72OCYMMU.1C1EWX0YPDEOT@kernel.org>
Message-ID: <aJ2akK9rVo2XwgQB@google.com>
Subject: Re: [PATCH v2] rust: devres: fix leaking call to devm_add_action()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 13, 2025 at 05:07:41PM +0200, Danilo Krummrich wrote:
> On Wed Aug 13, 2025 at 9:16 AM CEST, Alice Ryhl wrote:
> > On Tue, Aug 12, 2025 at 03:09:06PM +0200, Danilo Krummrich wrote:
> >> When the data argument of Devres::new() is Err(), we leak the preceding
> >> call to devm_add_action().
> >> 
> >> In order to fix this, call devm_add_action() in a unit type initializer in
> >> try_pin_init!() after the initializers of all other fields.
> >> 
> >> Fixes: f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > This looks ok:
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> > But can't we do it like this instead?
> > 1. Allocate devm job.
> > 2. Initialize inner field.
> > 3. Use allocation from (1.) to devm_add_action() infallibly.
> 
> Theoretically, we could with a few additions to the C API. But I don't think
> it's worth and I don't think we should do it in the context of this patch.
> 
> > This way, there's no risk that the inner value may get dropped, which
> > could be an expensive operation.
> 
> If we actually fail to allocate a devres node on the C side, I'm not that
> concerned about having to drop data.
> 
> However, there's also another reason why I think there's no need to consider it
> now: I still have the rework on my list to get devres callbacks in place such
> that we can first revoke the Revocable objects of all corresponding Devres
> objects, call synchronize_rcu() once, and then drop the contained data in-place.
> 
> In this context I also plan to directly embedd a struct devres_node in the Rust
> Devres type, such that the *only* allocation that remains is the final one when
> the user of Devres allocates for the final impl PinInit, that directly or
> indirectly contains the Devres.
> 
> Once we have that, adding the devres node will also always be infallible.

Embedding devres_node in Devres sounds look a good plan.

Alice
