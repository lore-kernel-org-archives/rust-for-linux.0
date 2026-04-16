Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE2032D0D8
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 06:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776320030; cv=none; b=D4cusTHSRaNTGiBRb/C4l5Y1MtQb07atzzY/tPDhko/0z2YrPz6X8VGUI1r7Xxj2hy5SZ+MFYPMXh2hHiscaYHmSKZcFBbGm6veromKVz8AiKV85M64nfOgPaXsuqmhHSYHvldy1ImnZQVOAxlQ/wflxc++naeG9+c1qqt+P604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776320030; c=relaxed/simple;
	bh=M1ALu9fNdbtiAqZoogNeBenPH0obIdrSYJNxUUpQL9U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sWcmGiCbFkWG0/mZFYGLKMR73VaANaqqLD2DjSO+syhxvSO7cv64kDIpNaxNRMUjpN1cfU4yjweNMQewmfzZAK46Xc8x1Xj8IdbM4XqFcJIhne6PFJHiyddCXVWKfxiUal90DF55vsI3xbg8idgZlT7PU7S0TSlePbyhw4+40b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nYj0krlN; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nYj0krlN"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-67145c205acso3491183a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 23:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776320026; x=1776924826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1ALu9fNdbtiAqZoogNeBenPH0obIdrSYJNxUUpQL9U=;
        b=nYj0krlNoTibqr76pVpIno5mfsNzOOShksbLsU+yzDXPRG/rS0SLxLIV9Ku/jFoYNM
         Pn04K8dICipGX5VROiOLLhYGLuu0AjAY0mrP9BrJyh2E/lPWYrQ/as9LLVYkXYvfogaP
         HKLz1jG945Oagrixws2eV3gndZilUHLcB5so1+POoaU78tnrxE2mLDA5ttq++IgUleIc
         HJFjCweXZxE74WBOXSopgvQI1fWphHKZdlZaR7WnR/jMNVDIzzKEA8KlJ7tJBYaWJh4U
         9boY4bjPxyTBgNJlJIN8nRoqtTYaF5W0qsBm+pKhgNGAQs/sIUtTBtuAOY9LwygfAwF6
         8mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776320026; x=1776924826;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M1ALu9fNdbtiAqZoogNeBenPH0obIdrSYJNxUUpQL9U=;
        b=qn/ioNon6WuvCQibow4Nr2ukNP+sZ/24GszF+/PwhKYzVMkTwccgSAwdYh+6jEx975
         bypigKbmhYrA0DyolAaCsfJ46x2NzQgPz/GCLAwUy7gefl+dFIboo09wiWNxheto0agT
         Sh/0dLpxafPGje3kkUPzdrr12nPGYUiaGEpK1OXxlharoQZyZnXO6jASchZnASd1ImgG
         6a2yhpyUXw+U3YfDKkRa25BSYwLV8NuvwmhwvV2v/fMVWT9Ztn0/7TqeoXDxbMCNrVet
         9y6tYVzx8/nhuqhXh65vmnczGhwNqtGHDLdlLdRE/m8Phdmo8owQ/imoKwMx1zj0D0iF
         MUzA==
X-Forwarded-Encrypted: i=1; AFNElJ8hdFB9KQzHhq2OI5hLXJWZgEnk2jIhVD+VkxLJqPXU1OIpTAX+YHw1Xj7QBsM3OwqvUajc/3KSiRp+v/1xgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHy4mn8x1qRaKSj77a9qXoXWmCfV09z7lbAyn+6/fG3PVWkEsq
	hltC2vLSoTqEX7FiW4hieZPbEOdvsenghIrxWN+wTd+WCmCaFkfpPohXum7tyOdtq5IaW/YzWio
	JuKC7jDx8a03py/Yxlw==
X-Received: from eddm9.prod.google.com ([2002:a05:6402:5109:b0:671:dffb:f44c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:914:b0:672:88a7:387b with SMTP id 4fb4d7f45d1cf-67288a73b30mr307393a12.2.1776320026217;
 Wed, 15 Apr 2026 23:13:46 -0700 (PDT)
Date: Thu, 16 Apr 2026 06:13:44 +0000
In-Reply-To: <20260415232830.8128-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415232830.8128-1-boqun@kernel.org>
Message-ID: <aeB-GDgiMwJZDN-G@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add RUST [SYNC] entry
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Waiman Long <longman@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 04:28:30PM -0700, Boqun Feng wrote:
> We have two pull requests on Rust synchronization primitives with 10+
> patches in a row for recent cycles, so it makes sense to start the
> effort of handling this area as a group.
>=20
> Luckily for me, Gary Guo and Alice Ryhl agreed to help as
> co-maintainers, and we also have a talented group of reviewers:
>=20
> Lyude Paul started the SpinLockIrq work [1] and did an amazing job at
> improving the design and implementation.
>=20
> Daniel Almeida resolved the Lock<T: !Unpin> issue [2] and he did a fair
> amount of reviews in areas related to synchronization primitives
> already.
>=20
> Onur =C3=96zkan started the ww_mutex work [3] and did an amazing job at
> consolidating various design requirements and decisions.
>=20
> Of course, this only reflects my own knowledge, and I believe they did
> way more outside what I'm aware of ;-)
>=20
> Note that having this MAINTAINERS entry is meant to bring more people
> to help on the synchronization primitives in Rust, which means for patch
> submissions and design discussion, please still involve the
> corresponding maintainers (e.g. LOCKING and ATOMIC),
> scripts/get_maintainers.pl should have this covered.
>=20
> Link: https://lore.kernel.org/rust-for-linux/20260302232154.861916-1-lyud=
e@redhat.com/ [1]
> Link: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-0-b=
067c4b93fd6@collabora.com/ [2]
> Link: https://lore.kernel.org/rust-for-linux/20260103073554.34855-1-work@=
onurozkan.dev/ [3]
> Signed-off-by: Boqun Feng <boqun@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>

