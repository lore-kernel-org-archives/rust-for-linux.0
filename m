Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58142A1BF
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 23:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767827737; cv=none; b=mpLmJGSBpXG4gQYv4BaZp2ceoSeuJS3jTzd2oIH/LIjRd3ziNg6nwRjwLiXCp2CN0ca1Gd4qX2F5JXdV0lzfMKkUkyBacft/8CKavz05p8lIhrCQaC/rDDOpV1XZEzxku0QI+DW/Jp3jBuAzv37BZ93LaZbUspqK09hPtWqY3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767827737; c=relaxed/simple;
	bh=fP91KKSw5MA+rJ0EnR1gclWFdXFJuBgGeBJdF312mi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LftRQT8rNkNcPejFSCtoL7UHv2UVmu+sTr10Z4c3mUmSjKeOygn3HbndQLEkIOgYKjiDOXYiOKcNlzyaCCwxMhaHk4Frw5Xosb1HdrHhWVq+22AwRRnewgK3XfEevxpB2zw6o2t0jiu93eA8skR2IK7Re0tgHPr3KMbdI2DRXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTPNVhBn; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTPNVhBn"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c0f15e8247so348401685a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 15:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767827735; x=1768432535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44z7Qcj/F7c9xsaK18gfGkk0cNWQJi6teoseAgBFPUk=;
        b=TTPNVhBniNoFJUgqxYEsD3oppuRHQzYt1SYPQXc6PF5DkCRhDzclFE194iffTaU4MW
         3nJsptYi7+K+X3iGWxAb/Xxn2vys/5zzIq812GJP7P1aJYK1l56nZUUIzWvQIfHe/306
         CAghYae+UFrBNpC7xS7EYjC4H5qCD99Ldq/mPZ6A4aEUdGp2anbqczCOWztwEDXB3seG
         wkNtVWRTM7ceSCB18NL1h6dEAodj6Y55lkw6jurcaLufb47Ortcb/AGc8xaI1vuZydoK
         vUECT09DMeTmjcin7l/Coo54dFGsjlqlbPmvCPlsA/aUQK4cfuoMQdri0O0nvnN/SfjX
         id6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767827735; x=1768432535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44z7Qcj/F7c9xsaK18gfGkk0cNWQJi6teoseAgBFPUk=;
        b=F8ovhQsgX5jox3uR1LyXTnHStFy1aGmMS5sasd0qnoGCoAJqEimjV9U+lDbbcBvSq8
         D8/ZmGIaFQnnaadCovvIK95YCAAz2Y3eBOCFbXet8cUNHGpmKKzFJ6jRygSUSx+zwQ2B
         iOtqJG0ZnEH4MIPh5WRJUzX4Dx558ScLgQoepOP9GZPmQZA0IKo4rv3Fdme4+fdgHZbi
         4zxxsg04A7wqL2utys57En2voWE+Yni9QPxKfUvluR4RRTz252uXiUB4FSoVDRIPEOpY
         q82NRtNvrXKcAuAakAP71DXJmGf4pmXaxvsw88zG2ncmuNyHuMNnGz2wqIvpdbQpWB55
         zkPA==
X-Forwarded-Encrypted: i=1; AJvYcCXX6MsEezC+Agzb7iw1JLbnFJeC2tzstvmRP1l8rwdi2F6w+WF5bXgU37S3tHXaONWrLN3FeTSRDRZTilVEkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIw0m7B+pZCKRnleWHaqkLC467DRo6Tps34cUFmK92vyXfXfDm
	q5Q688Bqcm6JSFO9p8onbT1r8DQC/Lbgp5Ny57JQHu5zWqQwr9/9eQ4s
X-Gm-Gg: AY/fxX6T1GHJx3VfnXIxzEykZ+WidPumT4TW3yeGZMIflSaU2e7e9xkwqehErNydkvN
	qmwvnlvGgKgCeFMZA2OM9PeoTIkqeaNgZRTQYo06ZNjvfdgk1Rix9/ch62foJTot9g/cqt0Tynm
	51oMO8Km+APOJodhIyUTZdGdX9g1k9aj6CIlxqYAZr9azbTEBuv9V82+G15vNytq84KLW1sCmGS
	0Zez3yBVVi+vy/Z04usbO5aqSj/NyL5MpTiH5YuHS3XEvdv9xcQpt2y0IrM0TrNsYiEpFPPviOu
	U6riOq+g7IH/0Pmtf0mT53xtn3oDv+5FVw0QhuyMsRw7RMYPpXFQboQa9jV7jIgfbhRBvmlxzi5
	MNmN/iuq7HGYkRhtXSNcH4LsEvNGuK/Pky5IPpoj1qFZhbSpYzzcBw399J+k9C6cHL3DM1lpzjS
	zGmeq1uKV/SV7ii9VfnMwj2eD1bcA5qC4xcPBZWZkbn85UFzJRHx7OjaOPauB1YinuqUlFLFHlX
	njE091ljVVBJtk=
X-Google-Smtp-Source: AGHT+IEH8sGJdYplFVacwjO9rhbmkl7E+XKqxDqXSvRDdYXwNzloPO8xP9Y5ntAewqlVeKzwAb2rKg==
X-Received: by 2002:a05:620a:450e:b0:8b3:274c:d9f8 with SMTP id af79cd13be357-8c389388a28mr560847485a.22.1767827734823;
        Wed, 07 Jan 2026 15:15:34 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53c422sm486167085a.46.2026.01.07.15.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 15:15:34 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0DA87F40068;
	Wed,  7 Jan 2026 18:15:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 07 Jan 2026 18:15:34 -0500
X-ME-Sender: <xms:FuleaUc5mc_AI9aeIFUcDE2ZUaXyda0UIMWj0KgoZXg05lxjpJS16A>
    <xme:FuleabZ0p53KzAAvIUN-Payx9hiILFFpDb0M8HDppYrEMOvPufLfJXVZwuOHlX8zZ
    zWkudtTNoabUBmntAbomf14ZW7PVHMQ4pTGXm7vArPAuNirsSMT_Zg>
X-ME-Received: <xmr:FuleaY69Wh63Dr_4KR0WRvoYoJfUwxvUgT0EKrn67gD48qLDeHt6jp1z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdegfeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehojh
    gvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
    dprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrhhoshhsse
    humhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:FuleaZeI9vOMSecSvszGF1Z72ZZG0-uF62Dh-RsXVdCZ1IZrJTApRQ>
    <xmx:FuleabxlXx49EyBTE8LAFrDS2LdDQYGu_VY_mN5a-oiEo1BXqC976A>
    <xmx:Fuleafq4NbachHrhX4wn5DysFuDHmd8lOk10-sWcgxSVikM0HtYCZg>
    <xmx:FuleaZzvQ26YUhN1e5IZ-ssmguuIQ-BVpXK-fzWW1S6xW7k5puzTxg>
    <xmx:FuleaTpCOK-zQEHDxYarQ-UUEaXpJtiiRsb4sc9nHUqzGyZiMEgzmHlv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 18:15:33 -0500 (EST)
Date: Thu, 8 Jan 2026 07:15:31 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: move #define __rust_helper out of atomic.c
Message-ID: <aV7pE5O_Z92GUR02@tardis-2.local>
References: <20260107-move-rust_helper-define-v1-1-4109d58ef275@google.com>
 <aV5vwMe_AiyQ8ePB@tardis-2.local>
 <CAH5fLghgm2pPdKen2rv6MeSXAYG_j_eCqvM0b=VbTbUM9eswKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLghgm2pPdKen2rv6MeSXAYG_j_eCqvM0b=VbTbUM9eswKg@mail.gmail.com>

On Wed, Jan 07, 2026 at 06:20:02PM +0100, Alice Ryhl wrote:
[...]
> > whenever we changed scripts/atomic/* we need to rerun
> > scripts/atomic/gen-atomics.sh to calculate a new hash value of the
> > generated files, so we are missing this:
> 
> I tried running it but I got an error from grep about no file input or
> something like that. I couldn't figure out what argument I needed to
> pass to the script.
> 

$ cd <the kernel source>
$ scripts/atomic/gen-atomics.sh

works for me (on my machine ;-))

Regards,
Boqun
