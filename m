Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106208;
	b=3+hDNTnWkmO3iQKqLaAhCuhrobmNdBBn4/F1qvnmS2ERUMd4Xt9HVHnwcO8f4m/zTDTk
	 wQwrwQMTYJbILDl2Wxehq+iOJAyolPHvS8mr2kLCAxcS+NlpsiHbwRTmnohxvb2mVhcys
	 kN418jHWja4G5fP0L00ofIkKZYKRNwMBxFdatmlxet+7Lx98G5kCOHGVxjpmM6TIQHzMf
	 bMrOlo+gW4lEnGFz6OplyZiZAp5cdIFB5hoOsxhvQ8WoRjQiCJ/eefdIQsk+S38aAYhZI
	 G24gU2afBf+38ZBzJkL3vzano9s3SOurnQdrlB20FGSAj3mt//agYg0oKAwwd1Ni1Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
	b=j7EfPVyLTzpE65/qFy/pnQBMSQBBIzZbQ0EbgTKyn7XunLs9vH2cqT8+GyVytHw2Irh1
	 5nNk6qPfuIvVC4Sf2KvB9slcHXrP3Q7DoTFHrnFd1FWdg7Xg/eJXv8j74MR97VKtM+H8w
	 uMA5n2Dv/8+6174A8YOXsiwg+OIA3gHKf93n8WcM+66tcXGMmxoaKQYPfoDsD106b4Dxm
	 QDZ5MVx56qNGpb7k/ntTi6/fr4G1IIoO6WnN5dAZIF/Uam1Q9cqb7EKp9e5xBw3Z8FWnw
	 oerdEeldO2WvFENGWWsKp/O5beNsArOhb2/Hq9ZY5tTrzV4qiy9Fgqv27Z9R3HHHtvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lTB+Mdf5;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02153606A332
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 16:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02153606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lTB+Mdf5
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55d3563e50eso32102161cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 08:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795106207; x=1795711007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
        b=lTB+Mdf5G+dkkh81cAzRgipAhlC33Dp9DjIi0zLkYyfkdbtaTEOW/on9aDpCbCstD8
         FGdRYGkcGPHpIpu5YMZ8IiOMrzgfLwHXCmbRe7bgWEiR899Ftaev5X3Ut1C/HnBArExR
         a2sk6F3+C/ENMjPL7h7/0IGYS8HfzFoTioBlJDIi05rrfuwuJIH4z/iVW8sFLVBVf7cl
         K/FINze0hKhuEAMR5D9hGYly+PL+s9BAIdVm6NoTwgWrXZ5CSiz3PW8BTODNfIGW1Po9
         fyXXpyX/ejiFBAJijaIaSbiDVfWnRbUkXkLFCAVl/8PpynXYRW0HERjpLjYpDk+3cxSu
         J29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106207; x=1795711007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
        b=nySZHKcGuVHdzP/kgjQj+UaJP1fmyGncnlK5dyBQ1l20v7M2r/gCnvFP+6f055mXJ6
         fqPh2dvvYBdGvdxoq/0r5RCVLRebk+qQW2mtAaztZ3phx+ppCyDTBBcg0awcz/f1aYjW
         RyCYzPynSa3OvsUA3qg9r8uNYJZ1XM4yog91kZSsZ0y3uzqrd1JTycE2Q4sOCFV6bpt1
         jPQ+dnk9b8RU4W+C7Xuc9LQ/iZgG3GvV8dwFwwxJUZWckckT/0Yq6aLljnJBoPZYgDSr
         5VkjdSsMWvvzeG+8cvpICISyMjGkpoZ0mf0kuajX/Cl+3fiUghjxq37N3JO9hF0Q+hT/
         ao+A==
X-Forwarded-Encrypted: i=1; AL+hErGlYK7ClcejMAx8mcjocm9PD++4n0gpHBO90f90BkHbDOHOrXJNmkVo4MBFNQgfTw14663vdsQ6gI6qEKnAjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LX4C5JDR6ZKOKSxs+aqZuJkmtt443/xMPjg7FnWv7QQCu5htZ
	esOg3QE4VR8ewsFvEZFM6JzfqJMZhz3mTHoEyMdIvx2hvDFwjKI4VzprbwdS2/IUZLw=
X-Gm-Gg: AYBFou3FuByMwGDASFmpt69eMnTzs6nYR0/uQRlHm29eBEjcViJg0LmNelnN+anFQ51
	Wf8XPKJiFefU+IwNGAd6fSrWISbV+FligqlDzyZqmJNouziLJW/Ahkufe/K2p1isk5uzCK4nYEi
	gpHfvSewjjJ4bPEny/X46VwPLyNP6ZPJrW7UhBNYHabcLjf55SkXJe41sGLw6XcnGlGUjG3G5dB
	n5pchlEFMCXGTfIyrUyO+SvOWpvi/6n2btD64gVUhHnWN40Iotb7i+RCfsEvN/QNHgxb95vCgNU
	+rZS+oK2OrQ4qjs0DiCmw4IlnBx5tfGGHX6/06Phy86ckPvMZB/rH0WFh64ZYkdTJ4xCPGr8xtV
	ILgrZMT+0l0bdmm9ZR3+K2rYV9QPC6UHV3DpYRpFc64zRaEqFdiReLy1fc1aK5NAou0qfGnk+5D
	3WmeQuZxAzNJb6rNoZ/CFgz39zcDGCFB3QbAZ0fP3j1nrF7wHHaAz2qZWTx90LMAnBWxR6b+jcN
	fPoaLqcvDWWbKdf1gw7hmcBJnQDmuhrzopdANN3GdfnhZ4cU48trUl01tQj8MOiiQ78+GmgBWUZ
	OzJipQ==
X-Received: by 2002:a05:622a:988:b0:55d:5ba6:bf25 with SMTP id d75a77b69052e-55d767ab475mr9697321cf.0.1795106206697;
        Thu, 19 Nov 2026 08:36:46 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c52318sm27455131cf.29.2026.11.19.08.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:36:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU57t-00000001A8R-0Ufm;
	Thu, 19 Nov 2026 12:36:45 -0400
Date: Thu, 19 Nov 2026 12:36:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261119163645.GL3115493@ziepe.ca>
References: <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
 <20261119143151.GH3115493@ziepe.ca>
 <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>
 <20261119150857.GK3115493@ziepe.ca>
 <da198506005be5c69d61105a5519121fe7bcdd36.camel@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da198506005be5c69d61105a5519121fe7bcdd36.camel@collabora.com>

On Thu, Nov 19, 2026 at 10:47:01AM -0500, Nicolas Dufresne wrote:
> Le jeudi 19 novembre 2026 à 11:08 -0400, Jason Gunthorpe a écrit :
> > On Thu, Nov 19, 2026 at 09:52:59AM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 19 novembre 2026 à 10:31 -0400, Jason Gunthorpe a écrit :
> > > > With the additional twist that alot of embedded HW has apparently
> > > > choosen to not implement SSID but instead has a pool of SIDs that one
> > > > device can use, functionally similar to SSID.
> > > > 
> > > > We'd need also API support for unbundling the DT iommus=[] SID list
> > > > into something that the SIDs can be attached more like a PASID.  That
> > > > need, I think, has become clear with all the DT tricks and fake busses
> > > > to try to work around this issue. :|
> > > 
> > > The word "fake" never flies with the DT maintainers. On that subject, I still
> > > don't know what you mean with iommus=[].
> > 
> > When you write your DT you can list all the iommu streams in one
> > iommus property. Like this randomly picked out of the DT files:
> > 
> >         iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
> > 
> > If you do that then Linux sets the struct device containing it to
> > put the same paging domain on all of those iommus.
> > 
> > It doesn't make any sense to open code this in drivers when you can
> > just have the core code do it by writing your DT to match how the
> > driver wants to work...
> 
> The will be rejected, as it does not map the hardware. If you check multi-core
> codecs, each pair of core+iommu are independent from each other, at least enough
> that they could be driven by different device drivers. And so they have been
> described separately in the DTs. I don't see a fault here.

All these multi-stream things have a choice how you model them in DT,
both ways are "describing the HW". Fully seperate HW blocks with
multiple struct devices or a single struct device with a list of
sub-engines. IMHO neither is obviously more correctly "describing the
HW" than the other.

However, the DT choice strongly influences how Linux works and drives
certain behaviors inside the kernel. So it is not just describing the
HW, it is very strongly describing the SW model too :(

Choosing the opposite DT model to what the kernel driver wants and
then undoing it with a bunch of code in Linux is not nice. We have run
into trouble when people go down this path and start asking for new
APIs we don't want to give them. :(

We had this chat with the DT maintiners too, I think everyone agrees
things are imperfect here. So far the direction has been to change the
DT to match the desired kernel SW model rather than hack the kernel to
accomodate the DT.

If you truely have HW with frozen DT in firmware then maybe that is a
strong argument to push back in this case.

I recognize this is all imperfect/problematic :|

Jason
