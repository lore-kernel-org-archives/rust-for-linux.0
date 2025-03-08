Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF823196
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Mar 2025 05:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412397; cv=none; b=rGX/OSYt4xPKyqZUzn+4iDk9g97DlvpCh/8JdxBuXLLBd8e6nd4zID1Fz1DbBokZDykMy/qxdkQB/FA+mjRipBlxF75TdknJI4xPIXbuXJxTm4I8awEEK1Y0ZVrn5XRM2Dq03rMkxm+7ERQtS/KEJXlKMuMBi93yh9emUw12ZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412397; c=relaxed/simple;
	bh=PucasF6SmJQU0DSxH8aw5+AP82JRAYkhKWrpgThe3sw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mjG1wZR33SUYtFPBaTsLm2pPe2W+4gxiOLq721QjMxUBP9LEfiRVYpHU1QnbJR/cf0ttOPoVitFzs0BznOh2Kznb7xxKVQFsV/W3gkHkYXazXFEeBlfw3yCO5j8YfppgcOxnjW8k12LQB5f94VWZ4hldvoQfPU5rWpHv1VOBR74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcTEVWmL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcTEVWmL"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223594b3c6dso47541645ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Mar 2025 21:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741412394; x=1742017194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z60QZvehPoSypFg/FPBuZBF1D7Cx8sowOm+f1+IpOps=;
        b=NcTEVWmLHcBNdp4aNaadv6lV8sVY7pObFCRbmm+UfTVujO7ny0QF35Og5IgwELNnJh
         KNcw5uaxoYTWwKzFtgjJ8zJa82i/EI5L1GgDroxQFQV5CKUJTJ21ckwlYZElAXE0JzGo
         z/3igV5bxSyuxX4MwcFPSjLJWBui0y+pEudEoOKPRvNaseymenOBr1Xn2fEYnBKpcJRJ
         l52iJ0BRsJKJsGfOJ8vrGBODBj0ND18CtXhx3wMdR49n97TiVTPfd/hjM+z33oopNfKH
         jF1/BmozKanYNv0qQDZJl3nrb2xHM/e1cCof7CfcNWvgsUWlXZikwtG/54vP3WpyEbku
         w7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741412394; x=1742017194;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z60QZvehPoSypFg/FPBuZBF1D7Cx8sowOm+f1+IpOps=;
        b=b2qZpHL6/vGh/UpUURgJgf5HuPGtP4mxbcXZqOmP4qtnccETK3mIbE15Abdsk7BNtX
         1huEA2QXklnr1KqZK7exSqIDbXZ6wj8hSJgAe2ge38UBfHko/uA9ez3g6f0Aq+ZivK6s
         C66it+YVWjt4onx0lpOTobt3FFGHn6AHmJmUlfwTuiYue13f25Pd631lCN6F3xuvSVDz
         lfs+bv8VZhH7CMXpXhAoibthXx4Kx3iGoCzDA0i1ZcfAB2bo54wt6FCcGqQgaK0+qiq0
         gIt4lLvjbpWRT/YJ+q7mLuttLn7G5e6EeXNZ4XpA60ZMn0B1SxS2yeaHgwkRJBqE+hI1
         MiVg==
X-Forwarded-Encrypted: i=1; AJvYcCXh3BLlH2+Sn4oTz5td6oyIKAiqBoKb6ZcJhPQnJT07u3pbBlnWwTgyVA+SU+eGofUjiI7l0BV6+R5uBj8c1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3I1JFaXnK257TWAKpib32NLOXbZqOn48OrjTmde4p6VOZEkc
	F2M6xIaptmAgYYCTUEwQlBEyqwQbcoADJv0htHPVY02tyF1k0Cxu
X-Gm-Gg: ASbGncvQ2PYsWjrVF5+BKPr6tWiKVgAlnDWxv788KPJ6SNq8RtymR3RkpvlfFiqAepI
	nqJvt/xdcCvdWGuYDupW0vDF0HXbzzfB2L9yfJjHmD4UmON2bcVvO5dmu3WvKhO9Q7ZVq813ejr
	K62BJR/VTqzWYxz23yhC7MJdt4K8yETxO0i+puMYOYAFbSuLVyYZqNqAi2xxRxiDQgVuX9/Q2iP
	727Jpa8qwB0MDkeJwFWew1ruHhu7jcM59Z5O8hJVnjNfS5CphahsTGJYKHxHQIQJdQaFuJRgwlb
	qrr9/YqSYcic/KLCY00xTEutw4Wu13PyuFtOiqlb3tezafvkOcty3FUQQYowM4PVm1vdUDSqHbR
	b3XLQjNflMOCfv8Qv6vdln3QsRo4bYSCIXzPqrA==
X-Google-Smtp-Source: AGHT+IGlJTd2oNiT+t9Tr/j/a7qQFeaw1jEgqgb5dVPCfkraoN4SrRXl7XlIejH/mpkEO9E1/Q81Dg==
X-Received: by 2002:a17:902:ce87:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22428ab58d8mr98760725ad.31.1741412393911;
        Fri, 07 Mar 2025 21:39:53 -0800 (PST)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddd8dsm39791575ad.7.2025.03.07.21.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 21:39:53 -0800 (PST)
Date: Sat, 08 Mar 2025 14:39:37 +0900 (JST)
Message-Id: <20250308.143937.716322981738491898.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 rust-for-linux@vger.kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: module: place cleanup_module() in .exit.text
 section
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z8vWbxp7BS3fKd5f@Mac.home>
References: <20250308044506.14458-1-fujita.tomonori@gmail.com>
	<Z8vWbxp7BS3fKd5f@Mac.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 7 Mar 2025 21:32:31 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Sat, Mar 08, 2025 at 01:45:06PM +0900, FUJITA Tomonori wrote:
>> Place cleanup_module() in .exit.text section. Currently,
>> cleanup_module() is likely placed in the .text section. It's
> 
> Do you mind compiling a module and using readelf or other tools to show
> which section the symbol cleanup_module() is? Putting that information
> in the changelog would be nice, and it also shows the actual effect of
> your patch. Thanks!

Of course!

o layout of C module example

$ objdump -t ~/build/x86/drivers/block/loop.o|grep clean
0000000000000000 l     O .exit.data	0000000000000008 __UNIQUE_ID___addressable_cleanup_module412
0000000000000000 g     F .exit.text	000000000000009c cleanup_module

o layout of Rust module example without this patch

$ objdump -t ~/build/x86/samples/rust/rust_minimal.o|grep clean
00000000000002b0 g     F .text	00000000000000c6 cleanup_module
0000000000000000 g     O .exit.data	0000000000000008 _RNvNtNtCskuib3KEDsuT_12rust_minimal13___module_init13___module_init40___UNIQUE_ID___addressable_cleanup_module

o layout of Rust module example with this patch

$ objdump -t ~/build/x86/samples/rust/rust_minimal.o|grep clean
0000000000000000 g     F .exit.text	00000000000000c6 cleanup_module
0000000000000000 g     O .exit.data	0000000000000008 _RNvNtNtCskuib3KEDsuT_12rust_minimal13___module_init13___module_init40___UNIQUE_ID___addressable_cleanup_module
