Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24AD38B7BF;
	Wed,  4 Feb 2026 21:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770242149; cv=none; b=KmpaN8HIFYHXnKG6jsChBhVqd3whojsf4+UciQfwA747jiqYsZWbNzyGfzSO5xxkmwJo1CJmtNZh80dmAq9SXsZhYWLs2x53d+p8tYXyYXq8UVse33srbdVXuV7TUQgx/vFIZy0Rv3H5qfHFxnPFdwiUqdehHxZhS9ovwBzXPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770242149; c=relaxed/simple;
	bh=wOfnXzh2ckvFapvTz6BoCu5ZRM5//a3ZHPIEyQ3UXmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugyZPOEDxlrVYBnuA6nPhmsx8z66M3epP+P1+iHqWpRxLQTSg9SD31G2qFvzMmGUnuUUhnx4lonCKEB+mTlinGuvntmlfoKibRU2x60NNM7kKgR/5pfGdFLyTOr6wFJcurrRpSwgtati3Ow4kfj0Rc04fgM0+6w8uoI7SwJsgKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=U6pwBUiM; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="U6pwBUiM"
Message-ID: <dfc04388-9d43-49ac-8497-3488916629e0@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1770242138; bh=wOfnXzh2ckvFapvTz6BoCu5ZRM5//a3ZHPIEyQ3UXmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U6pwBUiMdFg4+y2i5sqtOVz/w03c7IN+Zr8UWz3BkqLK/ZZni7GAxNVJKkUjpQGFz
	 Pn9v1WuEoEo1QHDO8sKoMGoWiZk58lDOQijFEhUZ/YgbHJZsO36xqGhMxMobegY7Wi
	 wL3TSD3mZ7G5RciQLs9uHLIOe294jx9O1itbYjpgId56krBlm39Rs1qSjZJE5ouhCS
	 l8NkRJzgHkFYIz8VZE3PMg2GoUcoB1vR1h32lcl1qLT5Obipn07u9t6YNcmC8jW8Lw
	 kGCjMbe9XD7NhnJeZjHPDxTuRQiAzDipNO2LFFNnfM/RrZHPyTeilbrebzjE2/uafo
	 IO6fKdJvn+bPA==
Date: Thu, 5 Feb 2026 03:25:29 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: alloc: Add shrink_to and shrink_to_fit
 methods to Vec
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: cmllamas@google.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com
References: <20260131154016.270385-1-shivamklr@cock.li>
 <20260131154016.270385-2-shivamklr@cock.li>
 <DG5FEPO6RCK4.17KOY7PRLNFKV@kernel.org> <aYIWd9wzPIRa4gZc@google.com>
 <DG5FWZ2CA3DR.2WBZ27YUYS705@kernel.org>
 <8006f30e-b794-4852-bc10-2981b5d010d8@cock.li> <aYMgWr6iDTus0vDE@google.com>
 <DG65LJ401SCS.S5LFKDR4AEE1@kernel.org>
Content-Language: en-US
From: Shivam Kalra <shivamklr@cock.li>
In-Reply-To: <DG65LJ401SCS.S5LFKDR4AEE1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/26 17:20, Danilo Krummrich wrote:
> This is fine with me as a short term workaround, but we should only do the full
> copy under certain conditions only:
> 
>   (1) is_vmalloc_addr() returns true.
> 
>   (2) The new size of the allocation requires at least one page less in total.
> 
> I.e. if it is a kmalloc() buffer we don't do anything. And if it's a vmalloc()
> buffer, we only shrink if we can get rid of at least one page, since otherwise
> there are no savings effectively.
> 
> Shivam do you plan to follow up on the vrealloc() TODOs subsequently?
I'll work on v3 that addresses your conditions
(only shrink for vmalloc buffers when freeing >= 1 page).
I'll check if the necessary primitives (like is_vmalloc_addr) are
exposed to Rust - if not, I may need to add helper functions or bindings.

As for the vrealloc() TODOs - yes, I'm happy to follow up on that as a
separate series. Since it would be my first time touching the mm
subsystem C code, I'd appreciate any pointers on the preferred approach
when I get there.

