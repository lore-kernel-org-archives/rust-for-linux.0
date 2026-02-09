Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C94376BD3;
	Mon,  9 Feb 2026 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640170; cv=none; b=kK1J/LesfFaiFITkuSZhQZnuXEUiJxH4KSYLP0NMYkAnK8Gb14jon3ul4Gu9iXvTDjKcSBOID+nLEjJwWOFlSD6t6tZAvU5C3z568FzYNkCUVS2HTFt/GMiHOJJ5Ucafgc+g/YBIhPcnBc+nJlIs8mFP3Bz9e8Xm7T+1+lfootQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640170; c=relaxed/simple;
	bh=rZJsEwJQERROgyEOKeX0VRgi9ahkckCIU8JBoz0SPhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en3MtBWFFamLz+vkMulaYb7iS1h4BZU/1o9J2SbnuznPKcej4gQWjlx5ncefm2LlD7/pFEchQG5NMSyGJjmEvHpbeZSjQqvY8fpK5d+pFbpkIR4qHPc4+wM247kF/L314rZc4MFSNNi+YY0Fg0bIi8+Syogl+BhezFJDTcusBQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FimbCrO3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FimbCrO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C81C116C6;
	Mon,  9 Feb 2026 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770640170;
	bh=rZJsEwJQERROgyEOKeX0VRgi9ahkckCIU8JBoz0SPhE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FimbCrO3xbNLl5zpKdTswhL+5udkXP3NNz5ny++NqpSl/moVIpiBsyBJNHKVz8oa/
	 0JHXWuH2LZ4q/bluRskbXFtGjkVLrn6R4QLRS4pJICtH+6ARlhGx2G5U3ryk2hyYAo
	 ohWvOc3Sljf3NS896r5wx0UP9sRBwjQRHD/9AaSTDwDtYOScrnzOJiHSz8DfnoZ6Oh
	 cVOxeouAZOeeAJEh/6pMNtlucg6Qh2GK4OIgKTwqWes+06LVnRW1h/DvwRlm/Q7Jxq
	 T9jfjyLbCXQOBSWvcafVgW0zQhNFe+8eT48ZC5IHsyyq/xww4t8p5RQv2+0uYczpFV
	 fN3sdbLB4g1kQ==
Message-ID: <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
Date: Mon, 9 Feb 2026 13:29:22 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260209105456.1551677-1-mkchauras@gmail.com>
 <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/02/2026 à 13:02, Miguel Ojeda a écrit :
> On Mon, Feb 9, 2026 at 11:55 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
>>
>> These changes aren’t the only ones required to get the kernel to compile
>> and link on PowerPC
> 
> Is this patch not complete, then? It is up to the PowerPC maintainers
> what they want to merge, of course, but I don't think we should add
> the line in `Documentation/` if it does not work yet.

As far as I understand the patch is complete, the problem is outside the 
kernel, it is in the libcore provided by rust or the rust compiler.

That libcore seems to call __udivdi3() and __umoddi3() which are not 
provided by the kernel. Instead if should call the functions do_div() 
and friends provided by include/asm-generic/div64.h, or provide 
__udivdi3() and __umoddi3() on its own.

Christophe
