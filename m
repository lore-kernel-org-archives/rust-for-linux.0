Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626B346773
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630480; cv=none; b=VbgE3XJbeqD7Qx/p6ls+bILhNTk94WXJR9CUUzlQe3S12QmFq1XoDR9clzPLJvs20kOr+OhwjNjlMwUFzbPpxVdphFGKwjZt9PyRMTHMIEIc3HA89YT+gaNslk7VoHwHqTmklXtSsmVfwrx6zXdpc5ef+gFCeJLAetrt5KwxFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630480; c=relaxed/simple;
	bh=AA7FXil+Trih5c1d9kWVytFuGXphEJXf1NURtb9SB3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPiIkH6Jy+IpMnpYluGsda8WXCap4guZyHAGGeNRUaGqgP5HBfiLvsI7biYKMoHIDx/Y6BWtiHzq5ywt9gCL3vQpJ/rpM6cUJyDQCq7rwlIMJWouDcwSStVf+su0SA8EMAimYO5UHEPmO9drkG2f0wgTKVoZ9kujd+Gz7fradrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+lM8qSm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+lM8qSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774630478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AA7FXil+Trih5c1d9kWVytFuGXphEJXf1NURtb9SB3E=;
	b=M+lM8qSm06aaM2HXue/gJ+V2Twiq0p5rLC3hXuni8aajFX1Gep64kDG8y741Gwuva60l49
	6kJAWv5LfVjpmxOuUB5TbrP+FEBJ+IjvMOMXO5h6SdB2fsqX3j+I6cvaEbk1sDPKKqjRuA
	Q2yvUtceEkvg/4B3HikzSJCPoLYJOnM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-slc9wjMhNNKQa1jA3MerGQ-1; Fri, 27 Mar 2026 12:54:37 -0400
X-MC-Unique: slc9wjMhNNKQa1jA3MerGQ-1
X-Mimecast-MFC-AGG-ID: slc9wjMhNNKQa1jA3MerGQ_1774630476
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b8f5bce308dso236585266b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 09:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630476; x=1775235276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AA7FXil+Trih5c1d9kWVytFuGXphEJXf1NURtb9SB3E=;
        b=rRpcpqvVS2qDYf8wVWbxcQ+Nruo8aOSOa5NmtJZ7qNZlNBzrMEBQh0V61i56GrcPvx
         f7WCH21n5X1kfFjbRZFK7VtvmeuZs7TeO1AQWHj6DYvSwG6/cYp9Ho3yopGcy8Q8ZW69
         kzt3Dwsh23tS1fpc1s8SQsoLUU4HdYmblrKjuiTjgdNzzOv+Bc4Kusap2t9vCGyl9Ufd
         8/gHySqDoYgGWUPM9D8t0h+ucqHHSku2Q/1tivDuY4SVspPgYMgYo9Zk0nQ8enuoqxd1
         dm0AOTNI8XJ0mVaNKxVG9QVNA5rN7fGmysRlXy8Y+H9S+bnb5SoPL8HNrOYujHjWMC59
         jLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjMgptRJ622eron/8v6jd5CcGeiHs1JqS6iXlNNIck1nRhMlacHC/J8srmHgiYCOh8usb8K1sASxVAQUgU+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwstZo6j234Y07BBAiFeGhPaICFKZdxmM6YIwICYfzooG7Y6048
	gSVpz9HDizpZVLDwqCHeXIPPTtyvpl8m9i6BBHvxBVDHzdGWXcfBXzAu7Bp/ivZYlUpA5Mut64x
	rlN0is7tMOWx0sZ4piLrFpc/FhwdOuUNmHZiDI/oXJmd582tSKnWIjsv6+PkmxzHyYm9aZUIhHt
	xuq3GQFFfptM12TzO2D1J6Wa3/R2Jm2xQTpXTqrnfEIlE=
X-Gm-Gg: ATEYQzz7mrJwAvKGAh18k7s1J9E0ZNzBfuQSRN7q5P4BQ/bGvFiuGQtifUgeyp9zroq
	zrmFz5yXEG7YuTjdRA3s929VoPABSRvsA7BfyaBUD90IvVmgBQ7ShGlSPbCUbxVp9sKHyIUKHVg
	gCTyCx/xuYXTz642T78YuxZzbB2urxQ6zX84jRSb29yMPeGDqx7iBJxkuHBmbs3OOUaBDLsJJQg
	tvXTQ==
X-Received: by 2002:a17:907:c294:b0:b96:e11e:97a3 with SMTP id a640c23a62f3a-b9b509438cdmr207734666b.51.1774630476016;
        Fri, 27 Mar 2026 09:54:36 -0700 (PDT)
X-Received: by 2002:a17:907:c294:b0:b96:e11e:97a3 with SMTP id
 a640c23a62f3a-b9b509438cdmr207731766b.51.1774630475513; Fri, 27 Mar 2026
 09:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
 <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com> <DHDOH1FXTIZT.1QKZIPZ73YNLI@kernel.org>
In-Reply-To: <DHDOH1FXTIZT.1QKZIPZ73YNLI@kernel.org>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 12:54:24 -0400
X-Gm-Features: AQROBzBbM13XF9Lw32GUQ1TlyrNM8BNb-Fkj0IVXkv6U0HfbzJXabBJAUaFVI5s
Message-ID: <CABx5tqJho=k88A1L0neVeaiYCXpLsc7UjzGSgAug73ZC_amYag@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: amb2elrHhWUWXvJmdxA-c1-_X-WmAgqSOGkRSr3zJVk_1774630476
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 11:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
> On Fri Mar 27, 2026 at 4:17 PM CET, Brian Masney wrote:
> > I am not a clk maintainer, so I can't leave an Acked-by for you to
> > pick this up unfortunately. I've been quite active in the clk
> > subsystem though the last 6 months or so.
>
> I'm not involved in the CLK subsystem, but maybe it would be a good chanc=
e to
> offer stepping up as co-maintainer (also given that Michael seems to be i=
nactive
> for a couple of years now). :)

I mentioned to Stephen at the last LPC in Tokyo that I am interested
in becoming a clk co-maintainer. I've sent him some git pulls for some
of my work the last few development cycles, and he's pulled them. For
this development cycle, I collected up some patches from others that I
feel are ready, however I didn't hear back from Stephen yet:

https://lore.kernel.org/linux-clk/abLV9vjYxXsKciHW@redhat.com/

He separately pulled some of that work via the posted patches into
clk-next this week. I don't know if there was something he didn't like
in my git pull.

To be honest, I initially helped with reviews trying to free up time
for him to give feedback about my work to address some long-standing
issues related to clk scaling that affect DRM and sound:

https://lore.kernel.org/linux-clk/20260323-clk-scaling-v7-0-8e7193dc9405@re=
dhat.com/
The kunit tests in patch 2 and 4 clearly show the issues. (I'm working
on some fixes to this series right now based on feedback from
Sashiko.)

I've become more interested in the clk subsystem as I learn more about
it. There are other improvements that I am willing to make to the clk
subsystem, however the current situation has been quite challenging to
be honest. I will help with the linux-clk subsystem for the long term
if there is the possibility of me eventually becoming a co-maintainer.
Stephen can have veto power over what goes in.

Brian

