Received: from r-passerv.ralfj.de (r-passerv.ralfj.de [109.230.236.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717523346A0;
	Tue, 24 Feb 2026 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.230.236.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923980; cv=none; b=HUWKmtgJc9NWx/KpsbWCtt4DHLuIeefhIrlzkJOioRpU+kES6BYrGHKS/Ppz9U5yPUKviMkPZaoV6WIJU82ArK8EvXtoWbUlhegMM/AIzSQe6cSEekHnyk7uQNfjJwiDPD6wB5GEIe8IL47ghnJA2NoI7pIXM+SgDKezZgdK3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923980; c=relaxed/simple;
	bh=OSQW9JK0igywcpVRUVNtIHNuLXdUzjzJawoBHMP3w30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HlvNdMSma/I46CCWZ86+AMncIPpet80xnSyBvq7Adp7y77BUVe9HXhArRvRxHvqi4DrLUUWvxTj+3qiKO5KsGRue+I9IMEjLelpjdUw5cI1iZcXp2tvrhjmUiVl6oX6yVQZoJHsMymLp1uUJQHIObr2RBe8is6EiDHTb3xhXx5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de; spf=pass smtp.mailfrom=ralfj.de; dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b=qBoTYToU; arc=none smtp.client-ip=109.230.236.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ralfj.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b="qBoTYToU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1771923494; bh=OSQW9JK0igywcpVRUVNtIHNuLXdUzjzJawoBHMP3w30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qBoTYToU6O6WpDW4IWSgV8tCF1IeZzUS6BbFTM0hMfWV+qxwzJcuZo3qw4P4Wdprg
	 bEUqNiB10O/dILFrEOOpb+6Cq7BoEyHXim3bcEJEF+XebylUKqmVGXlHR2Pi61sUuG
	 mPC+NCvSHP82KwObVmRnNZp9+YcBNcJs0RQivlnw=
Received: from [192.168.178.20] (53.206.40.145.ftth.as8758.net [145.40.206.53])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id 7E4E320525FE;
	Tue, 24 Feb 2026 09:58:13 +0100 (CET)
Message-ID: <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de>
Date: Tue, 24 Feb 2026 09:58:10 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
 peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
 rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Jubilee Young <workingjubilee@gmail.com>,
 Matthew Maurer <mmaurer@google.com>, David Wood <david@davidtw.co>,
 Wesley Wiser <wwiser@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
From: Ralf Jung <post@ralfj.de>
Content-Language: en-US, de-DE
In-Reply-To: <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

On 23.02.26 16:31, Miguel Ojeda wrote:
> On Mon, Feb 23, 2026 at 3:26 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
>>
>> I think, disabling altivec, fpu and vsx with compiler flag will work.
>>
>> What are your opinion on this?
> 
> It is really up to upstream Rust -- for us, i.e. the kernel, it
> usually doesn't really matter much how things like that are
> accomplished: whether via flags, a built-in target, a custom target,
> etc. However, we need to know what the path to stability is.
> 
> My understanding (but I may be wrong) is that upstream Rust prefer we
> use built-in targets for softfloat instead of disabling via
> `-Ctarget-feature` (and that the other options may go away soon and/or
> will never be stable) -- at least for some cases. For instance, for
> arm64, please this recent change kernel-side regarding `neon` as an
> entry point:
> 
>    446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat target")
> 
> So please ask upstream Rust (probably in their Zulip, e.g. in
> t-compiler or rust-for-linux channels) what you should do for powerpc.
> They will likely be happy with a PR adding the target (or whatever
> they decide) as Alice mentions. And until we reach that minimum
> version (in a year or more), we can use something else meanwhile. But
> at least we will have a way towards the end goal, if that makes sense.
> 
> In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> involved in some of that discussion in the past, plus the compiler
> leads.

Upstream Rust dev here. Indeed we'd strongly prefer if this could use a built-in 
Rust target; we can work with you on adding a new target if that is needed.
The kernel currently uses a custom JSON target on x86 and that's quite the 
headache for compiler development: JSON targets are highly unstable and directly 
expose low-level details of how the compiler internally represents targets. When 
we change that representation, we update all built-in targets, but of course we 
cannot update JSON targets. So whenever possible we'd like to move towards 
reducing the number of JSON targets used by the kernel, not increase it. :)

Kind regards,
Ralf

