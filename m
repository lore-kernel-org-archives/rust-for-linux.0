Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4862DE706
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902918; cv=none; b=dxYMx9ErzjHhP5PFnC3lp83dGDQsr6wRSFlysSykRGOvdkeRPI8ue4hJYfWlutrm/l66XxFInHcFBmxic0DoQM1ADh5E6X8OepmIwMlrKjnr+iBAdUyda3McI3cMAGuAIR5IoPmMrEZf79ddlDqwhTFFI+gabyz9YyaW1xU0ryQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902918; c=relaxed/simple;
	bh=XGeDYADKLkXA+Rdxqd4AtLNFZi0ic2eivpV4V8rIZwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSYaF3iUuLJRLFzkAm1wAVGP2uoaCZDDZV/e6x+EAUXshFYerBXl7hEiVlMlOBvq63CZDLILJR2n0dCYzp9wT5ix2I1Vxa0W6IDDHpNci3XJnj6C9ZLyn7XPr3TcTTrX6lSrRgZNkEQSOGyav4X0Pe6hE3K7coa9vVhZbrfJrow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plpzZ3N8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plpzZ3N8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE7EC4CEF1;
	Mon, 11 Aug 2025 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754902918;
	bh=XGeDYADKLkXA+Rdxqd4AtLNFZi0ic2eivpV4V8rIZwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=plpzZ3N83cDu+miI1v8cbz30jVsqQ6oR3gm2hBZorCSKV7LfJ97R1NfSOxl0FGEuT
	 Toxi4nos8yk4p4w+1jGVrJWXUplfN453Q0+veQ9JUlPTVo2alABvyWoVNwhuSjp7lN
	 MZOqtyAq7bVCgteeZo9j2ysbEZRNE5BQgrdmvlqm+lcOLp/+KpjW51RScDoRqNhxAq
	 hkGw2MWV1+LGb2l8C2Y5C1MI2qXt1kPxVaBMdyzf8RALbsBA+8pGJ4En6IPJNjdG/w
	 ys4s2JHzce96zJmMdkZcGJtAiVGVs1ArO7+V992nqhB+bBAkp6hrlOwdpprVlZF7Va
	 pjrOVXs1CadvQ==
Message-ID: <64c36657-d73d-469a-bdad-e5b18a7a628d@kernel.org>
Date: Mon, 11 Aug 2025 11:01:53 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rust: page: define trait IntoPageIter
To: Alice Ryhl <aliceryhl@google.com>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org
References: <20250808181155.223504-1-dakr@kernel.org>
 <20250808181155.223504-5-dakr@kernel.org> <aJmwjMCgFPItcURy@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aJmwjMCgFPItcURy@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/25 10:57 AM, Alice Ryhl wrote:
> On Fri, Aug 08, 2025 at 08:10:18PM +0200, Danilo Krummrich wrote:
>> The IntoPageIter trait provides a common interface for types that
>> provide a page iterator, such as VmallocPageIter.
>>
>> Subsequent patches will leverage this to let VBox and VVec provide a
>> VmallocPageIter though this trait.
>>
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> If you call this trait Into*Iter, then it should take ownership of the
> underlying object. Since you only borrow it, I would suggest calling
> this AsPageIter instead (or go back to a name like PageOwner that
> doesn't need to follow these naming conventions).

Agreed, I think we should call it AsPageIter then.
