Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64895221290
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 21:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765488719; cv=none; b=qtVsdBwTLXzR7hX1MLWvsQdbx1nI5BHxp5GOTVDp3WAeiGTxXjedJt7y8bNyHzZOvQojx6fHiHn8w52TP94/UVgas2eSBhgaIpaELAi3vorOdVzXxFf+8o7jJYKUeWb4cveoYUedXJlM1WINGjpd0iXRksH9JeffMp2myLJmhfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765488719; c=relaxed/simple;
	bh=+8V/Cw0Bh6WMEocnm8c5kr6IwDXC2Uo4UHlqpDCQ0T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vcerik35JrPJgR49KOMmCXiDYM0FAzLq5/ZA1bcT61MedrMm6RTIwMVQ6q9UC1L3DtjoCKbez8vmhTown2H9L8zGZBTmfV+gUyr/ozOIUJ7lr9/ljmgRR1pwiDprm0/sCTdIZBp5gPElKColWajs+ZAsafZwjDdHxrK14sXd/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI+R32gN; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI+R32gN"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4edb6e678ddso6729871cf.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765488716; x=1766093516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Argb75K7PFGjqTuhZtNNZeNloHzK5kKcxCpxByy6XzI=;
        b=AI+R32gNXego0/nF/BSSid+fQ4bVEnzOxhv6nHDrfESVf3phzzHgiwb9qmROtyveqp
         I76wL+IIDN93ux7WDW/4CqEJWrVQ0GNgNwJoxHy8OTbBob/YKHODRuCBynj5Ve3tGEXG
         87z3vgsllOPyscxUO4vKVDlxiqayORDXIoBJYl0UOFZDg8SnMpm/ryujEUIIumcO9Spd
         xS8M4huHxtc1hnR5Cl8jrRgKEiYq49VIdOk73CeNQ6APqS90viEM3Q7FsHAwvf21wB8H
         +V+qplGoeHXiKt+oxhg2AkZIvmjzSemRnmwNZj3N7igr5diOrAHLRYhHbP4GGHyoc/Cg
         jXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765488716; x=1766093516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Argb75K7PFGjqTuhZtNNZeNloHzK5kKcxCpxByy6XzI=;
        b=cOgC+rRo7NK3DoqFhYzpadQvD8iISDTp6thwxue7dJSIhleNtS0ogS+j86bkYlrcee
         PDJACN5Vf7xZt+r4I5qS9vGcYlMJgMN95sDnRH1My37EASUXr40KKtgEqLUk+32crGq4
         SDSdxlFVsfu5zBj85An8kAN2VJovjdn4L1hxCqTmFVVsSHH7V+vrC80EaKS41jZ9yADA
         4qM7UdRM3C9PCRfIveMupW0NHKjvkNMy/5vKVDFlql8NGhhYMJ0kwNytGDhtcQkoBUel
         A9of7XvCan3GZ9KbqWMDO6GXijFYBqZIvXqhh0UBIpxsZoJwilu52DF/YlFcf5C3Je5b
         oUmA==
X-Forwarded-Encrypted: i=1; AJvYcCVx7EvbbpbSzYtAzh3LgLTFj5SwxhFXhPtYPBhmIg1UjS9ECmxze2+5RL5ECyjNhzf2Lgj62YGWnibZaEYqsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGQbLFGaE6GcX/ypwrxyo7jyshFTNMs68QagFTD4/195CmEtw
	un5X422UorpZAczCdcbeid4FAxlXo32lUQK2FV3QoBQcpJQ7xLqQWnVY
X-Gm-Gg: AY/fxX7N7EuoBYRHnjBijXV+m8xuK2ZgbFpQl/dUvfRVLV8ICKypd0W/ft8VgB97gD3
	t9EsFre3uPoQ/YZYreNDv/mlBnyDecZCHp2lkC0PyehD/hcl7Gr4SumEHzaxvQTvg5p9BSzgIVW
	HG3mrNs3Hi9sVGP/OXixllov4IFkIBAjc66XwOKYoTKpm5Q7Ph6SEPFphq9Wz0BE/r+ES1onnFF
	+3AUYScVUy8DQlsFcnLEovCgO7KtlUYKAOpLOLosjsP3a1dr1iv8q+sY7XpLgElhIWllXAtDiKz
	y+GM/yf5p1nSCAnQHXzODckCehljb4EfvNMUeWVBoeH5s1N66FQWaM6+/7RG3UIus3vhN08mBDU
	NrbAuLhBq+/t0CQGUv0ey5x3PosWr8/hKGPDymGBR/kwZPqmFtI4rZb31giAU+SfzdvKXV5lJAy
	R7PixazZoF2TVLBr3p+sbaujBct6JGxc1/SRK+D6aIBe4oubLRt/oBFc1t5OSnMC4zFV5nla4Hc
	1+B4g4MoyOg8wA=
X-Google-Smtp-Source: AGHT+IE9l+7eBLqzvQpUem+VtoKLcnoj4dvB6X0XnQWCEgiLwLnO1jFohKvngZ3bA3ksgKNI1iouRw==
X-Received: by 2002:ac8:57cf:0:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f1b1b722fbmr103008541cf.59.1765488716247;
        Thu, 11 Dec 2025 13:31:56 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ef16adcsm31052836d6.46.2025.12.11.13.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 13:31:55 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 34ACAF40068;
	Thu, 11 Dec 2025 16:31:55 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 11 Dec 2025 16:31:55 -0500
X-ME-Sender: <xms:Szg7aU96819Jry86OhqY8icvHMeWlvk45tRqLtKctm5bBgJa_OcDZQ>
    <xme:Szg7aTykvZ06ht-q1oL-0TuiuGH4Kuh-9OgadI5ZgPcWvYMfvKzCfTHaPgPWy3jL1
    XnYI6PzAcGIRduesnKMWcIByWRzZofWclZSh9fnUyNCaFg6EOF6HRc>
X-ME-Received: <xmr:Szg7aRv3ZgRfMLw0HhsPxa23M3TSVDD3q3rsFliaAkP8P4e0N4b9WXH0m2QBYh9FrAhUb_esBAFtcCCkOIg13-Jc4B1yDInWRfU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeuheelhfeivdegffejgfetuefgheei
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtg
    hpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepohhjvggurges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilh
    drtghomh
X-ME-Proxy: <xmx:Szg7aa0szGI6HWzIwSUqurT_QD0-rUQp6sgGbgQqiLAj3Vwz-t6q5w>
    <xmx:Szg7aV6BSDUo4HmNwia3h2woheWj50XJcDW4G0BFN6ulZPX2QbCvYw>
    <xmx:Szg7aUM6kziXWHqMTT63nXI-KHcn4Qg4aHSipuu_W8OnHfZndEZ4dg>
    <xmx:Szg7aREF-8euH_vlesl6wTc_zsSWrwCSXehFRI-TBfAC_lxnb0MqkQ>
    <xmx:Szg7aQ0W1sBaO7hh88b93WxPRwb3n-7l-zpBMH21Oa-pbOzDrvjTGsiY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 16:31:54 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	x86@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] rust: sync: atomic: Fix fmt warning
Date: Fri, 12 Dec 2025 06:31:33 +0900
Message-ID: <20251211213133.56265-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <202512110753.8B3YlvtX-lkp@intel.com>
References: <202512110753.8B3YlvtX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
introduced an import ordering that rustfmt disagrees with. Hence fix it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/lkml/202512110753.8B3YlvtX-lkp@intel.com/
Fixes: 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
Hi Ingo & Peter,

Looks like I missed one rustfmt issue in the commit 14e9a18b07ec in
tip/locking/core, here is the fix. Feel free to fold it if you want.
Apologies for not catching this earlier.

 rust/kernel/sync/atomic.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 3afc376be42d..c07a53f8360b 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -21,8 +21,8 @@
 mod predefine;
 
 pub use internal::AtomicImpl;
-pub use ordering::{Acquire, Full, Relaxed, Release};
 pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
+pub use ordering::{Acquire, Full, Relaxed, Release};
 
 use crate::build_error;
 use internal::AtomicRepr;
-- 
2.51.0

