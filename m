Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F93E2DC334
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 05:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701275; cv=none; b=D+JJLLGvXL0YUNOgbwuc1AsRyUd1auftwhdUV8YyBEObQcsanPw3mrQvnIbZlgH+TIq1V4pflrykvYcJJZjADagbU96k6qsxctdZtg/xO05Cf2bJzfj1b5rPAOXtwsa+Zbl2r0fuGSqlRVD43HU5q0PeN6mgHtWtKnTyQxh9rVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701275; c=relaxed/simple;
	bh=gpfZXIL26yw0eoRgI8npQoF9UhYTLxkdrNdj9WNyQgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiaVygbjsUwmS+biEDfEmeQ4qp1SjDuSnEKvW02U20s6EX3rk9zOhHP0k9OGxrDFazkidHWtxghLsDYOUPXr5ZN/0xtKG5cdYlminz+5nRUOvBwHmgv9Df6NUdpLab/Tm8RMlO4Se8EUdgArSzqHESwm/x6fegkz5WHlPXMEVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3tqk5WT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3tqk5WT"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8220bd582ddso271283b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 21:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701273; x=1771306073; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ub/c+5nle4jo1LOlgEbt6FoOGItUZ21Wn4ncWd1nj3w=;
        b=g3tqk5WTsL5G3YX7Twdf8G2kCrcWSu02cSOL11a+o5To1Lhi96PMJ4yjHHrLV+TDU8
         9Jyv7BE78m8QJI+bZTj7jdL2ii3BPy7vRB2bDr2TpEQ7MaMGTyNeBVaZldB4dXHbNxPp
         SL5zig9zOALSswWU7fIilsL2omxODY9184t/Pob7esLN0VomU0fHWboXYkgFYoumQip+
         /5UaTXaiNtY0lQYNAdFhRwumjpE+94G2274lQycWaDoDhnTAx9LqGSwB4AqCKuw2HUaR
         R2Zb9C9tX0NJMpiCxhEoiEK0TTjOePfuAEHjqsIT24nMG2A0m9KIHX7OjgVHNnBmQqf7
         bRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701273; x=1771306073;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ub/c+5nle4jo1LOlgEbt6FoOGItUZ21Wn4ncWd1nj3w=;
        b=AH+jFVeVIkXy9BSqTpjzq7R7/FvhPC/t+Z5ubY0eXkT3gtQeprgDeFOiQuoixfsnEi
         BTs+EvJ6X0ldDzRC3nJDF3N7JOLyK2CMo1YM7uQ0dETFRMdGhHK2Cb7GOqDt+xEw/8CA
         zIOa1dCtbo/HEZqKogn6Ghhw9gJcAhuM4o+lpXBSC8UOU6TJSopWPrK+VpJDI7qqoL+V
         i4/jasAJomcbyn25VnJ7zIUlil59spWj66uZrnQm0ZGVUixBNdA4XtGzB7gu/MJe+hVW
         I5bvtkC9L2MkwotmKzEfa02/0OezCs0pc1fahaheeAtFcNKfG5cs3tMzrsbaHIZFURLy
         lemA==
X-Forwarded-Encrypted: i=1; AJvYcCUtPHtGhZQkagiUnvm4/2nPpWzowPnLAm8bm2LklrPWwfDq2mbfzEc8XHesyn8Zqb3wNx7G28XBNbmjecrgJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmuob4NLQ00My/JFp6Yx2PjONVXfhtiCd0Ptqnqt0CvW8RFD7W
	XlX7oycLCJE3REdVFvPW9PLS7rJ+RDSsNtrkKMdJB44E68uuD9VXdqyO
X-Gm-Gg: AZuq6aIPBlX7HFDoE/euqM9bpcCjhwjvLIaB8xPNsA4KhpXvk1IuM2YAWZGz+FhwT4R
	sY7YbWC553g60NKvhNyN1WswNEvvXEBn5YtfI5BwaXONeKiRw/d8sj1xOKWKusg9ujisCEbJ6Wj
	5edJkj6TymnVqjImG8pccv9xSWv2Usn+xy9YQ0RP9Ur0XfNVYCiE7CgJFTIw6yd/zdvuaNJbvFQ
	WAhXul8upM98jm5DMufHU4nfdcq1R8Ij9PzQm5LDmTutOeYseKaDpZuZiaUInDaVyhVImEm4Q+F
	6gmTBfoGDMm1Ed8Ni7s+snxE3wfkMspMRVrOzhHWec3MxUgkBsO+reAZkELarOTKvcFflIClSd/
	O3S5GVvBoWANBkN1DUUSqYCPyNGnsQOsUweRVw1r9Rhhzy/7kiDjratP6qQ7KLBBGtcIvEUmTth
	EIPLQ2PA/zOzeC4TSuUaPcWmAIPaldGl3TdlxqU2AhguM+ohU6Vv42Ysc0TJ1ogH2Z8as=
X-Received: by 2002:a05:6a00:2381:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-824416f2b42mr12082799b3a.37.1770701273149;
        Mon, 09 Feb 2026 21:27:53 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244152456asm12794630b3a.0.2026.02.09.21.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:27:52 -0800 (PST)
Date: Tue, 10 Feb 2026 10:57:44 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
Message-ID: <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
 <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
 <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>

On Mon, Feb 09, 2026 at 01:48:01PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 1:29 PM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > As far as I understand the patch is complete, the problem is outside the
> > kernel, it is in the libcore provided by rust or the rust compiler.
> >
> > That libcore seems to call __udivdi3() and __umoddi3() which are not
> > provided by the kernel. Instead if should call the functions do_div()
> > and friends provided by include/asm-generic/div64.h, or provide
> > __udivdi3() and __umoddi3() on its own.
> 
> Yeah, but what I mean is, should we add this if it doesn't link,
> especially without a note or comment of some kind? (Perhaps to your
> tracking issue in GitHub?)
> 
Hey,

I'll put this as a note in out rust support issue on github.


> i.e. if I understand correctly, you prefer to not add the panicking
> intrinsics to `rust/compiler_builtins.rs`, which I agree isn't ideal.
> By the way, it would be nice if IBM could join one of the meetings
> with have with upstream Rust to raise this topic again with them.
> 
Sure, i'll try to join the call and bring this up.

> In any case, it is up to you, of course. My only concern on the Rust
> bits is on the docs side, the rest looks fine.
> 
> Thanks!
> 
> Cheers,
> Miguel

Regards,
Mukesh
