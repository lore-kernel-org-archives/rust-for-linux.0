Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06A940DB2F;
	Mon,  3 Aug 2026 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769821; cv=none; b=kB1W++7jsP8Jrli01F6zrE1D32jeg3Z90LWQ8LBn6mWcBXd+BPBUnT/sxwvCmv3+VaoD90j9ILTHZnhgJeUbpi3/qN8tyQi1zBd9+e+fk9j9ow//eYoipxxwmwIq4csO+ur+kKerN+ZxVPmUF+MfqQBYPb0Bpxh3frWIuoeEZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769821; c=relaxed/simple;
	bh=u0Vvh6VpwHkDmJn5oqnhRfR/YOPMA+ui1Xm6dcO/BtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzXw1DUrNZOUVFSxqeqKz1HAO3HFrZRhhPoqV4e8etWlCwZZJLNTfKJSu/nuvi/IO9IahR/CMmeZQs+ckG2cyIm91/50mboOsuQuNV0lt95WOmuxDGFmOUcETDKIMdoqBALcHVi8lDzrolWuQ0/rMgkQRevd4PQkd06s/Q3/TCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNKpQY8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNKpQY8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F7F1F000E9;
	Mon,  3 Aug 2026 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785769820;
	bh=Uc5Zt/81gNkuqTTcbgKmR2f03W/efvVVHNoBf6ID0dI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eNKpQY8HGyq2Z96H6bDOF+VQbsdL/DzPHba+MUa6GKfIhFP2ODEQl9caJ3JqKHDLU
	 2G+/LuSID0758AIShOKwiIJbQpoSjAx0nyGif2lPAlItJN3I2qpjBwrCSVFS0wbx4Z
	 mTApyzS6HIGpVz08tYIMfhhdxVIuHSEtEyci9J6U7/3rV/YnERzajXao5cb1VceQEb
	 lBcwtetZEunP+JI4YBji4vU607cwOqDapMGQlCiSZZoORf/BMMTFvQlx4p7ArRsMxW
	 4qIosQo/0UOObkMdteW1bEmC2Nx+fq0D8SUo1FtKcIR1S8EJX3L5a3ttujfoqlOwDT
	 SR2/DhUjY+46g==
Message-ID: <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org>
Date: Mon, 3 Aug 2026 17:10:17 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rust compile failure in next-20260730
Content-Language: en-US
To: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Bert Karwatzki <spasswolf@web.de>,
 Harry Yoo <harry@kernel.org>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162> <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
 <anCkbMyUIscmAheK@tardis.local>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <anCkbMyUIscmAheK@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/3/26 16:23, Boqun Feng wrote:
> On Mon, Aug 03, 2026 at 02:57:49PM +0100, Gary Guo wrote:
>> 
>> We could also unconditionally use `kvfree_rcu_head` here, and
>> add
>> 
>>     #[cfg(not(CONFIG_KVFREE_RCU_BATCHED))]
>>     pub type kvfree_rcu_head = callback_head;
>> 
>> to bindings.rs?
>> 
> 
> This option is currently not maintainable unless it becomes a
> maintainer-aware way to handle things like this.
> 
>> (Or even better, changing `#define` to `typedef` so bindgen takes care of
>> everything).
>> 
> 
> Yes, this is better IMO, but it's up to slab maintainers. :-)

Can you elaborate a bit please, how would that look like?

> Regards,
> Boqun
> 
>> Best,
>> Gary
>> 

