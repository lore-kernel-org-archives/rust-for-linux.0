Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3146321368
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 19:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Jl/GX5jO"
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C24E8
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 12:01:25 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-59b5484fbe6so58320167b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 12:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1698778885; x=1699383685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7r5QH3BEBiAIYvUm5xMjEuQo+8BuWYtUwQZzWNjv50=;
        b=Jl/GX5jO14JI+K6GMnn4hQyljYfFIAW3coiJ6rlAUvYNO5st8T+MGdSCBfY/ugs8mv
         gdrhAvNRkkP6RWENJE0O9Jen1CfmSq4O5Exprky4CT68VoOFtVODKrfzimQEGqx+hCkS
         thZL4Q9fDvdRrwC1UMhtKWweo1OGSY4za2KvBU25j3BRxxEz0rsznbrgoWrv67pTvVzV
         RSGXsKAaTlhln0OAWX7n8i1mbjfsCBiuWQl+1kQOMMemiEaXo3IgUDbqckqRNc3EDHYz
         VDpHk2PoEYmY855XsLY3hUawCvfGjwy3oKslMbOi8kBFRH6PdY5Ug+QmgClYZ3hxJprD
         zstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698778885; x=1699383685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7r5QH3BEBiAIYvUm5xMjEuQo+8BuWYtUwQZzWNjv50=;
        b=aS3aOdfLVUyUqD9Mskt8hpkeQbmhGUCqN40AMEXi6WpoohaM/XcMpMUbSyvDULVERY
         8T01y9iaFqd9hIpJXGq2hZdL0OYFw2buDHuhHhuv4C7DuzxgT5PHaDvM6Z8p4RXNjbi/
         j9MUJ3XOqrEW1lETuK8F1ZN6aF41IbaN7aNHiYJpd843tcQRQNDGlxbxX3VRZPySNGkt
         G49Q9huozj4jjNfXvLAN9bDIOf4E8UcjhB15Zms8i0yUGSdYtuvOmzJiMYXyE7DrmRjB
         bOWFolnzNPG6JOS5/hIEMD6DRG74cCCsW7lw3Xgfk8BV0xpVL/x0XXmT750uwgyM8LTN
         yi3A==
X-Gm-Message-State: AOJu0YzGqnCKt+W+VHl4alGKLqZZTVMDrdWdV50K8bU9m56I2/F8PoE7
	Not1mtBLR8zYhrprnoFMARnNmtCe0g1BcBNP808bV/ahgP9qiGcfvQY=
X-Google-Smtp-Source: AGHT+IEW0J54sWj4NNBgLx9JBT6qOKH7bXheBcqXCW6j8Itj4/LLMHdM/RbaTFc2WSHQ9IQl5jUUupvN3FFga9HHc8I=
X-Received: by 2002:a05:690c:714:b0:5a8:d86f:bb3f with SMTP id
 bs20-20020a05690c071400b005a8d86fbb3fmr14961211ywb.8.1698778885097; Tue, 31
 Oct 2023 12:01:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com> <ZTT/h5wKL7STeOhC@arm.com>
 <ZTUCdS0Vrev1iQOv@gmail.com> <CALNs47vb+-_wD0uKQJYVMswHdivOr-1v6ajQ3hQw4wNs4Da0rg@mail.gmail.com>
 <ZUDry1L3w4sdGRN5@arm.com>
In-Reply-To: <ZUDry1L3w4sdGRN5@arm.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 31 Oct 2023 15:01:14 -0400
Message-ID: <CALNs47tSKk35y3U-HaP4DoCKEP4BpT9h9MzuCFtj6WBQPdrTbQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>, steve.capper@arm.com, 
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com, andrew@lunn.ch, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 7:58=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
> I'd say Masahiro's ack only. However, it's probably too late for 6.7
> now, the merging window is already open and maintainers tend to pick
> stuff up in the weeks before.

Right, thanks for confirming. I was unsure whether the BE discussion
changed anything, but that could likely come separately.

- Trevor
