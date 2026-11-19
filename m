Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098878;
	b=YlZLWS1ZSXieez3HAa/Dofcee2PfnmRBdUNe1GiK3pJaswZPzgt4M9p2iVLD66NPFn0a
	 IdR0Z2cGRrkp75hGGWCOuT0XkagF7bHH4aiKscM3gF5EYTgO/zclc6T1a7XMSJaDKZ4aY
	 ME5/gy7KX05kJGiTtgCwn35Q+cExbimsKySdM6d+Qwp2y3W8xK5inpZ4vRItbKg8hldyV
	 AKAwhexcbPkR++VvlRG6Hp1IEeMmJCEv/417J772jlUdjUU6Cug5QeQ5gvsE8sdIIjjHc
	 EtmekmCZ+nz/D6FMLoOXsYVZ/LTJdmXSahR8mnPhVj93qWFRi+BIB87wtxDV50KbITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
	b=KgNHMOF/VLlH+OxEd9bIPFfHIKrm+27LtBKRYQN3rfe/DGKgbGshAPS7GOFfHkcDX1Lf
	 BaYmNAu0SapE3rmUeJVTnYmWhpSRfMUgO3q7s8Ew8tAHWMFbktTMHzqSpaIGYlNAD1J4Z
	 lsBc4F3lqLEZfPh6Y0YldDCGixBBOhulz1KqpeRevZdu0PzsvMQr48ln6vvxj8A41fwxU
	 dsUqcRKeSYuyEXrgpbdn46tlMWXpCRveJss7E5gP+mzbHxVYHdr2H9qr1H/oPf5Ylt8yw
	 0VBoPVSZe9WmkomRntqrzbbpnM6bG6xiCbTg9lWZBFh6hY5xp3n7P/+04x1hXEuovLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FGukqx6w;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B132606A334
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 14:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B132606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FGukqx6w
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c1f548f87so25877046d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795098877; x=1795703677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
        b=FGukqx6wpPtbvicikKJnmpUnf77pjGIiA+jiE6X6JEBPZ+faYks8agiHmgED4yOEFr
         hdk5SgN6QNcNWmaHK5/CQtpC5QhKTZoM5HWEQTRaM/vYb+IJQjLb2La0SmEN3wEfL0hF
         OMakZTmOvmrpZRNpBtc6dHwRmpAjuFxpGXHT8Al4rh6BwTuRvC6/EXUViYToy7xAyFj/
         oDwkkkQxUHfaXizQzT6Kb+Yk5ee0gFFj7YN98vUO8Vhi0QnsdrEwMvuUQVWGGQekvDAF
         yGpI+/l/LKVEeshVccW+SC0KAiYIDNDc+yXOfGO1o3dEihCZj4T/qk65YFtn7czgXevJ
         fTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098877; x=1795703677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
        b=c73i7yNy/WycbU0NZkoacFPQcW0NmLRCU1Qg1OC9xHgctMDcDEnDvdrjQ98ei6PA5l
         5MO5RchzYuiUIvZ1/Tjt4KOGb551jqxhBVf6qAehuEloHknmAccNW0Dd0i16PPRWLuHp
         JFdm0bh20Nvex/ZRDLUvo97Jo+dOZ3lPxLy9e/wXS3DULd5lQ+bycZ9flswkvMIT3kxL
         HceE68Lh+aIonWNQoLGSpDMgED/QlXSQRz31632yALkxadI6ioNfZQO255eYDGrsbhgb
         MG8hfvU6XEjs1hq1RJOR39vgQF3VBwSGzaZrOGvqqdr1BX5KdEaaZD8Z2cZtzd7nFELM
         83jg==
X-Forwarded-Encrypted: i=1; AL+hErFtev3c/m0zo0SXLNDBut2xVud6IDLTwC7On908AyvhHyCEnQYkLf7kW2cWlcaWGp+6MZlW5yjftgEaHntWpQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LoRdHHrAPmrdgP42+FXjpNLct70lk8RNk7lZEmciJcfP6NHld
	H78L91k4XrTuZP/RwqGCoGB55x8OJ5kEKkz/MMhHmftFVC22vnUXb8/HtVl+KS0eC3Q=
X-Gm-Gg: AZFdTZfFXaPTLFji1VdgTE5s5H7tlJ162g+7DyiJ9sp7I5LhqOmwBfZNfiX/ZBFYJV+
	awaCkkgSAG6BfxgI4zp9DrIhCBokI/ni//LyTLyIAfx9upLpr5j07zpwR3LfcTiNnAxNc+ZHIXp
	geA1l5t+eg5LOTr5fSF9OfLhcnAWakuBs+zV/NkFMyBlIA/N9qwCj7jwu+Hf8DKzjthLltTHobA
	Ln2v2066gUZYmd3Hw8BM7VBc2k58Cdyc3h8dCSrSitNVIQjqdSIut4UiIZamFU+sMm20CNdTKNB
	QDNY8E/f/tAYR/OEvZ5ubyzsX4jbnSoYPzdviPMHDlRc1lMDie7MroywDYEsedmXM5qfEEoo1f/
	2cet0/WRz96DAsJigb0goPmi1WyTlyOzu4LlelOEDexDTQ6s7N5tarQpvnbAvXZtOrGMGnNhrt7
	Jn2HGfTslkiHaIVHGNu9ne+/BSBnFo4GmRTqokQ2pHzBmj7YmRc4z3yL3tBmST1BL5b38nt6ac6
	3pNIuyHGHutAZKI5sir8gvMg4QDBwJSf1u5vLngeaR4rQkNlNagx1IqmOXFMQnNWbLhI/kGxONp
	A7JQ7w==
X-Received: by 2002:a05:6214:5e02:b0:921:16d1:7cb9 with SMTP id 6a1803df08f44-92116d17de5mr70719896d6.40.1795098877201;
        Thu, 19 Nov 2026 06:34:37 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92133fe4670sm339426d6.17.2026.11.19.06.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:34:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3Df-00000000tJC-0ytS;
	Thu, 19 Nov 2026 10:34:35 -0400
Date: Thu, 19 Nov 2026 10:34:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Message-ID: <20261119143435.GI3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>

On Thu, Nov 19, 2026 at 12:24:50PM +0000, Robin Murphy wrote:

> There is a middle ground, where a kernel driver wants pages to appear at
> specific IOVAs under its own control. This is entirely legitimate to do by
> using the public IOMMU API "as intended" 

Yes, but, we never fully implemented this because we never gave a
cache flushing solution for these users. Which is a problem for safe
rust to expose an API without any way to do the mandatory flushing..

Jason
