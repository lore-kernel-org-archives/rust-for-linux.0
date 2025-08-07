Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF82C25CC63
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Aug 2025 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754557975; cv=none; b=JNMlB99kJv/BiJbCoqZ0p14oLNtnTT9Ti6/Jy9szaEYAjbUEQVZjeQxHS9dueVpW4LkGwdsXb+cD4BjT+0x/fgt93Q3kjTCSVjE2y+CIGJoP28ISj5hOgTH4FvB1qAufJn2+WbC8wUQnh8Hd9WLeO4RJFjW3xYgNmGeaZWM0FhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754557975; c=relaxed/simple;
	bh=wfIW/ZUNfxu58SSM2SiLnozguKofflgokJlZ9IEerdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyOSd0sXlUSFP9rtVEF0OkYPBDH6wGzeFs6OW+//kYlfyugRfDCssvv6UdphzNWxEKlDYZVpVtbPl7njWf6ihZhWEUiT7UrR05VKyguQIDcF1+p16SIIv7eHSqTV4TJPmKwpsBHQhxXDIlt7EQGuna8yOJnQwTaDucOMEnCJLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rNNpKw5O; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=nVPVDcqx; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rNNpKw5O; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=nVPVDcqx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rNNpKw5O";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nVPVDcqx";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rNNpKw5O";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nVPVDcqx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF0F621F3E;
	Thu,  7 Aug 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1754557971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qqBtXBHsq4Hoql3eqKQCw6rO85ZWvPyk6i8mV6QF6cM=;
	b=rNNpKw5Oxw9KNS3JMHgCICoSRD0/rcIK7i+94edrigdtxWZ4DQYC8PyvybDS9le0RSx7FT
	A3jIr96wUGfeArylfY6XPPFpJ/fkvH2OVRy5gNN1JrFNroz7i5Dde09CaZDT36W2/FoD39
	22KUn8UxR/NE/BkxLwlUm/Df0HeZh/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1754557971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qqBtXBHsq4Hoql3eqKQCw6rO85ZWvPyk6i8mV6QF6cM=;
	b=nVPVDcqx6MX3lLz+sHdGybW4AVJ/UW+RW2RJ51LJl3yue2T2o4LHqfUBkNYNfaiP1G4P5z
	hiwIdD8fFKFxTZDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1754557971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qqBtXBHsq4Hoql3eqKQCw6rO85ZWvPyk6i8mV6QF6cM=;
	b=rNNpKw5Oxw9KNS3JMHgCICoSRD0/rcIK7i+94edrigdtxWZ4DQYC8PyvybDS9le0RSx7FT
	A3jIr96wUGfeArylfY6XPPFpJ/fkvH2OVRy5gNN1JrFNroz7i5Dde09CaZDT36W2/FoD39
	22KUn8UxR/NE/BkxLwlUm/Df0HeZh/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1754557971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qqBtXBHsq4Hoql3eqKQCw6rO85ZWvPyk6i8mV6QF6cM=;
	b=nVPVDcqx6MX3lLz+sHdGybW4AVJ/UW+RW2RJ51LJl3yue2T2o4LHqfUBkNYNfaiP1G4P5z
	hiwIdD8fFKFxTZDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B27EC13969;
	Thu,  7 Aug 2025 09:12:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4R1DKxNulGh7NwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 07 Aug 2025 09:12:51 +0000
Message-ID: <ff2a8dc7-f1f5-4aaf-9bc6-b095802dbe58@suse.cz>
Date: Thu, 7 Aug 2025 11:12:51 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] BorrowedPage and PageOwner
Content-Language: en-US
To: Danilo Krummrich <dakr@kernel.org>, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, urezki@gmail.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 acourbot@nvidia.com, Oscar Salvador <osalvador@suse.de>
Cc: rust-for-linux@vger.kernel.org
References: <20250806205044.85085-1-dakr@kernel.org>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <20250806205044.85085-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[kernel.org,oracle.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,suse.de];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

On 8/6/25 22:50, Danilo Krummrich wrote:
> This patch series implements the BorrowedPage type and the PageOwner trait.

Note that we have mm/page_owner.c already so there might be a bit of a name
clash and confuse someone. But maybe it's sufficiently distinct.

> The latter can be implemented by any entity that potentially owns one or
> multiple pages and allow users to borrow them.
> 
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
> 
> Hence, implement PageOwner for VBox and VVec.
> 
> Additionally, implement Vmalloc::to_page() and ArrayLayout::size(), which are
> dependencies of the above.
> 
> Changes in v2:
>   - BorrowedPage
>     - Add link to Ownable
>     - Use borrow_page() in the example
>   - Add PageOwner, Vmalloc::to_page(), ArrayLayout, VBox, VVec patches.
> 
> Danilo Krummrich (6):
>   rust: page: implement BorrowedPage
>   rust: page: define PageOwner trait
>   rust: alloc: vmalloc: implement Vmalloc::to_page()
>   rust: alloc: layout: implement ArrayLayout::size()
>   rust: alloc: kbox: implement PageOwner for VBox
>   rust: alloc: kvec: implement PageOwner for VVec
> 
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/alloc/allocator.rs  | 49 +++++++++++++++++++
>  rust/kernel/alloc/kbox.rs       | 42 ++++++++++++++++
>  rust/kernel/alloc/kvec.rs       | 40 +++++++++++++++
>  rust/kernel/alloc/layout.rs     |  5 ++
>  rust/kernel/page.rs             | 87 ++++++++++++++++++++++++++++++++-
>  6 files changed, 223 insertions(+), 1 deletion(-)
> 
> 
> base-commit: d2eedaa3909be9102d648a4a0a50ccf64f96c54f

