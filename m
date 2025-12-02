Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE552D238C
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700388; cv=none; b=N1v4PD3dN559DM4M4uybpa4CKhSJq9ZEg0p5pl4M2Lc461VFYuzDHCjmC/j0wfgiEBq2emY7E/QSHHlYXzcUqW/3RTATUhJFX+nLJyvkdy0P2riKf8JBE5G1yLk1roHj9gFYDGcu7SRKpGAUaMt8RKUtDFBIVvKV4Pn0oBmEogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700388; c=relaxed/simple;
	bh=12EEgsoRMtf9F51vxy2vNepd5KjbBuzaWngoebihpEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fhtg5VAujDV4HlfRn4+9f7FnEKYZodz+vVbF4Fs9Jq8IfEddnn8/VLalVym0a2Wr6BJ8a8+SPAdXYAxquCb8h2hzmr3JHtkvgF6PQbQxA9yON0gnZpdbqThagnTpFEvGc8jBVtDN2VH2p9oW/roJjYgxtDL2dlKcHLV5KbaRPqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7Rjib3/; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7Rjib3/"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-640c857ce02so5363189d50.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 10:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764700385; x=1765305185; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fx+vgxKEjmAmRBcQWngjnzb3HH/aeEsWQh1ReHY2Pk8=;
        b=Z7Rjib3/5CQ8iMSAUu+dlHE5RXe7ihpko8a6ln2e+HE//JbQwpccU2wuV4/4bdyiC1
         9xgdmB9LsNWT+4bGpX/C0TNW1V1JlnIrUOwL29C1motWCr2bppg4P/bYao+QUwDm8GlH
         8y5NWCdNTDfDjcTdo4HmUYSNd+0pYfqVg7/CzlA25t6zzz0GSljYx31u2hDBRT6J9gZF
         MYpllRWH/P2YQGRSa509VZ5VXtIiBv/vRvVMqduokUSLKlTyJKgEP4ox8SHhztBtvqF7
         16glN6m7ttBZ2dpg87Mc8NhYmeljQS8GYomQQyBBIxKfle3DOpSdMRu6FleS9BIQZ+pH
         DbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764700385; x=1765305185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx+vgxKEjmAmRBcQWngjnzb3HH/aeEsWQh1ReHY2Pk8=;
        b=OQUDO0ROi03o14HrxWD01IZyxNyrnRWqoCRYo+jED6XyKJNzXjRm6IkQzCGjrRMHjI
         TUxHUkwLaC/i61PWk/wQKv2UxdUCHiVJCPI1CGBmcihvL2sDskDwhuWHxS8Bay02zR3o
         DWmIdJNHTz2RVYkB1EbR6zYe4fGywyYkM5Tg/dxD6t46QQeK0+dGvFr04cFRiG2YTqog
         ouhBV7qZCQzt84cO0snZ2W97FFnMaY3GEgia+OewwYpe7Cz4ONQEruqbYKjvori3UZxj
         Q37PIjc9tqJ2vFja+J+pIBAH9+FfMYMFo02KT8gdBmzWPDcGzvSjd19wrTd0SRxxsug/
         j0dw==
X-Forwarded-Encrypted: i=1; AJvYcCWoJjVzSIlgHQQx0T5ye4yfba6PsY+Na8ViWCLCxcDSU0TIT3lWllBwk/R2agNTHgG82OpQE99OCK/411CEfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5q607CQulCJhUbRu4WV+AQ25rRXjPX6TFK/d/lh/kbrbBQIn
	ESHIN40LPhGUQ3XQugNGYRLf5t1i2B+fTx7+aA6FZDkeK3zrcEjrkzj8
X-Gm-Gg: ASbGnct9E14KOLoQL/Hq3/VO6w7Tu/m1WBtv64DIjgjRFH71M53mXORXqYl7FSyEUFo
	SILY1jOHo+sXGETw5YTRTb179RJX5IfukIxm5uNKBxOzQb5I+B91GvQO0TghKhFySqXqEWK2s0Q
	HAqWrIbKsJZ1DVli80AUTMtH4e1XlgaibPHF4/GipufYGRAVYkJwwKow3LsJ98BRME8Wvir/uxJ
	xfN/P+ClIO0vNi2N7Pt6pJ6hd40LH1g7cc6SW1MD3LsMPDlI+3GcjO67t6gjF7zisRXo5wGQNHj
	J6o0utYX4iguCk34wZYiosthNBuQIm64ipsuUu03mSw2bDTiv9Ba2AGVAlxR/U+7id0ufHdz4iE
	c5NjkJabWtnB0FHCJEwVIbO/72vMuFQ7Gq/JNr75utId0FTPRpa1wuThwOHyFCypelVG8LVSSnl
	bftoWx2gZA0lDp3qPB
X-Google-Smtp-Source: AGHT+IGOp5HU/6nmu601KlnOIw05JZHAueFK3GC0mnlmpUg0as6msbGwNFG0svNv0+Ued/h6vQr5CA==
X-Received: by 2002:a05:690e:12cb:b0:640:d009:e998 with SMTP id 956f58d0204a3-64435281c1emr281829d50.12.1764700385322;
        Tue, 02 Dec 2025 10:33:05 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:2e1:7f9a:ed50:e29e])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6433c497707sm6415723d50.24.2025.12.02.10.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 10:33:05 -0800 (PST)
Date: Tue, 2 Dec 2025 13:33:04 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Burak Emir <bqe@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: id_pool: fix example
Message-ID: <aS8w4FHhIVQUFTEY@yury>
References: <20251201000949.1626363-1-ojeda@kernel.org>
 <aS3seTNRum3ZXMom@yury>
 <CANiq72=1ipov2pV9pSQwGh9WMA4NvQRV_cBCO0hhChVg=c-Njw@mail.gmail.com>
 <aS7aHIJbi3DlaUcc@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aS7aHIJbi3DlaUcc@google.com>

On Tue, Dec 02, 2025 at 12:22:52PM +0000, Alice Ryhl wrote:
> On Tue, Dec 02, 2025 at 12:13:33AM +0100, Miguel Ojeda wrote:
> > On Mon, Dec 1, 2025 at 8:29 PM Yury Norov <yury.norov@gmail.com> wrote:
> > >
> > > Thanks Miguel,
> > >
> > > I applied this, but the fact that you've sent a second fix to
> > > documentation that actually is a build fix, raises the questions.
> > >
> > > Because Rust documentation bears compilable chunks of code, I think
> > > we need to enable rustdoc tests target by default, so that developers
> > > will not send broken tests.
> > 
> > You're welcome!
> > 
> > This one is a Kconfig in the normal build, i.e.
> > `CONFIG_RUST_KERNEL_DOCTESTS` (it is true that the other patch was for
> > a different target).
> > 
> > If you mean enabling that by Kconfig default, then I don't think we
> > can do that -- KUnit on its own (which this uses) is not meant for
> > normal builds. Perhaps we could have something that just checks the
> > build, but people should really run the doctests anyway, since they
> > typically contain `assert!`s and so on that can be wrong.
> > 
> > If you mean enabling it in Intel's kernel test robot, then I think
> > they do it (or at least I told them about it long ago). But maybe
> > something is missing.
> > 
> > In our P entry in `MAINTAINERS` ("Subsystem Profile document") we ask
> > people to run them among other things, so I would perhaps suggest
> > having something like that too (or linking to ours if you prefer):
> > 
> >     https://rust-for-linux.com/contributing#submit-checklist-addendum
> > 
> > Of course new contributors will miss that initially, but actually
> > people find the doctests quite useful, so generally people get to run
> > them. At the end of the day, maintainers should test these too before
> > applying and otherwise someone will notice sooner or later.

No. Maintainers are not handy testers at your convenience.
 
> Yeah sorry I forgot to check the docs this time. I usually do run them,
> but there are so many targets to check that sometimes I forget some of
> them.

Don't be sorry, it's not your fault. The problem is that bearing
tests smeared among comments is a terrible idea, and now you reap
the benefits of someone else's bad design.

(Did I warn about it? Yes I did.)

The other problem is that Miguel replied in great details about how
well rust process is designed, and even attached an external link,
but didn't answer my question: how to enable rustdoc by default?

I followed this link by the way. It doesn't mention that rustdoc step
is mandatory. It doesn't provide steps for careful testing. It only
says:

        When submitting changes to Rust code documentation, please
        render them using the rustdoc target and ensure the result
        looks as expected. The Rust code documentation gets rendered
        at https://rust.docs.kernel.org.

Does it sound like:

        Rustdoc is a MANDATORY step! You MUST run rustdoc every single
        time, otherwise the build will get BROKEN. Even if you don't
        touch comments!

No, it does not. So, I wasted an hour just to find nothing. But there
are some good news: during that hour, I received an LKP email about
your error:

https://lore.kernel.org/oe-kbuild-all/202512020552.NejH5iaK-lkp@intel.com/

It's good that I started receiving such a traffic at all. But it's
especially good because I was on my way to submit a PR to Linus, and
that hour saved me a broken request. Andrew Morton on the previous
cycle wasn't that lucky, didn't he?

So, what's next. 

1. I will merge-fold Miguel's fixes into your patches and send my
   PR by the end of this week, not early the week as I usually do.
   Hopefully, no objections.

2. I will stop taking any rust patches unless the author explicitly
   mentions that he ran rustdoc on them.

3. I encourage rust community to spend this cycle on reviewing the
   development and submitting process. You guys decided to sprinkle
   compilable code across the comments, and you advocate it. Now
   please find a way for everyone to compile your comments (huh)
   during a routine development. And please make that knowledge
   very sound.

Thanks,
Yury
