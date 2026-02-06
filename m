Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5762BDC04
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394602; cv=none; b=rHXkwFYjPdO+QodelBQiwa9YyorbpXcMDC7fRg3AQAd3YWbwyJ2OMC+0Udd2VKX+2KYsX+Y7UKvzLcpmG/HKfGA+kehoOJP52dJ7M5Cs+4mf8LVFcCKscH6JirrTuqZiGmPWwnKIYae49N1FYWC+1dcbDHkttKJx0lENpsSYKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394602; c=relaxed/simple;
	bh=mkEIRgVxKtBAjSFWvWQi1uEr1i+PMSOlpgfVn+mnrRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvpuuO/RbEXGn7EsbmzIQrowf9z8zdKhfDGY0w/xLBjsCIa4gPjmN0AAWPJhHr4HVqkYpDVNYzPN1yN+bxelQwsvy5pNhVVnjz6TCz4tpDn0tnD+H6cwe4UmRgvwuzJaMbB0q/17NXBPOGssZ4w5Xlg3lq+f4knaoBWSHdUN9cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eMiMZYTO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eMiMZYTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE4FC2BC86;
	Fri,  6 Feb 2026 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770394602;
	bh=mkEIRgVxKtBAjSFWvWQi1uEr1i+PMSOlpgfVn+mnrRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eMiMZYTOoNaRoWwdFE5mLYf60vJb7YbBIxOuc4u26MQkBHtaFoNqnhPQNkHQ4LqOa
	 wqJOLNbCJUCKsl7BQ6kSiO9okj19nE+vFTv0/W2bKzqvEsicExuHCFlJ1rglRrWSZj
	 mIhP7wwmkCgJEpxFrUxPCAX+U16aCm2k1qpGmX2w9cwfVBII7+MaM74pCJ5eyCXy0Z
	 LMvaB3KW68oHaPpRuYkv9PahfQdlNXX2ZHZ8127Gp9tGT25EF1+gC+89GaiTlLuaI8
	 YrTWLhkzinzJ0TDZfERNbmPR3moqT6a4g91EW/2UeX+M9ZxIQTg0BdQvHWjcIxb6Wc
	 Yg4qirsA72sWQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D6742F4006B;
	Fri,  6 Feb 2026 11:16:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 06 Feb 2026 11:16:40 -0500
X-ME-Sender: <xms:6BOGaSfsq_CR98mK-M51TF1pVFzfkrsAfjr5p0lxdmmX2UwecvGQ0A>
    <xme:6BOGadhHJBNLZ92zkRMSO2iokxI2UDapCnsqZ0kTLt7IrDLHEZ_Pvm9D89I7l_cUx
    PB6PYsW0J-jyqTrtVXwnOKXIDEHIQY7MSudBs9DtR7b5DO4eBn2Kg>
X-ME-Received: <xmr:6BOGaYKrTeVRBIiCyvfUvh9XcCGyev_s9ftUTTrW2Sisd9Ns0fyHY9l_KWx8Vn3Ogv9k_8yU-GdDVpKkUGbK_JQR8YKmtA28>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeekiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elueehtefhtddtgfejvdejueehhfekteevueeuueekgeetieeggeehvdffhefhhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrd
    gtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhushhtqdhfoh
    hrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6BOGaSp6vOyR0Gqah7So0lpaLpWF120mLjLqHPV4f-JjuMd5YvbYVw>
    <xmx:6BOGaVpd33JhdtQoJSb7zQwrgTWWVuT5g4U6NTpPhNIIsn2Nsl3uFg>
    <xmx:6BOGaYFiXs39JHK-2S50YNuqpsna_LczkZuyvLkllntJnb-KXz3v0w>
    <xmx:6BOGaXoaWr-HEOF9JuW8EqCUy2Sps_Lyh7gOW2HFebpOVNh1ncYB7w>
    <xmx:6BOGae0417co294kEfFN_a2jLmQgyFKAbhmuNgbDsvRB9PlZlONwi61Y>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 11:16:40 -0500 (EST)
Date: Fri, 6 Feb 2026 08:16:39 -0800
From: Boqun Feng <boqun@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <aYYT5w7qxIxM7cdo@tardis.local>
References: <aYVXQVwOZapVbnP5@tardis.local>
 <6792E792-2043-4BF5-952B-90847703F23F@nvidia.com>
 <aYYIikXcrXFOZDra@tardis.local>
 <cd3e4e70-a007-47e4-8313-ae786e363a34@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd3e4e70-a007-47e4-8313-ae786e363a34@nvidia.com>

On Fri, Feb 06, 2026 at 11:00:16AM -0500, Joel Fernandes wrote:
> 
> 
> On 2/6/2026 10:28 AM, Boqun Feng wrote:
> >> I was also coming from the goal of long term kernel code maintainability. If
> >> we decide to have additional preempt count flags in the future, does special
> >> casing 32 bit add even more complexity? (not rhetorical, really asking)
> >>
> > First, given what preempt count is, I don't think that'll happen
> > frequently.
> 
> Not sure I buy the argument of not happening frequently. I don't think any of us
> have a crystal ball. There are cases in the future that can come up IMO.
> 

It's just being realistic, and we pretty much use all the bits there. 

> > Also I think the reality is that we care about 64bit> performance more than
> 32bit, in that sense, if this "conditional 32 bit
> > preempt count case" becomes an issue, the reasonable action to me is
> > just making all preempt count 64bit 
> 
> You might be missing something here. You can't make all of preempt count 64 bit,
> that's the point, it doesn't work. That's why Peter did what he did to
> special-case 32 bit. See:
> https://lore.kernel.org/all/20251020204421.GA197647@joelbox2/
> 
> That said, I am ok with the approach now that Peter mentions 32-bit x86 is
> "deprecated". :-)
> 

Yeah, "can't" is a strong word? ;-) I did say if we care more about
performance on 64bit than 32bit and can afford slowing down 32bit
preemption disabling in the case where "we decide to have additional
preempt count flags", THEN we can make all preempt count 64bit.

Regards,
Boqun

> -- 
> Joel Fernandes
> 
