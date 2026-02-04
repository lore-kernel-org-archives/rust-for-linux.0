Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959B2BD5A7;
	Wed,  4 Feb 2026 11:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205841; cv=none; b=dLSsQsx16VPZDeiRUrucbYbFI9FNHYihHptC1DdnEB36JvHhKDZmKtaAAdqieWnww+21VYHPy/xctSdbmHvqV26ZE2GGFTNnyzM7oh/pfK69qbp20pnWykBASvfELQw1WNELfY4YyYR57zvWsvKCvZnfklYiBx676VTNlNR6kqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205841; c=relaxed/simple;
	bh=1xwVc1jp/H+lrImJ0szhjysOiGn27S6HNSl4UmqBjxg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aDCUfa/4DrAW9f2L9WnHdTiGheUlUUmH5HXjZPSpHzdnA242eTAL7gQFWirr2XweLRyDM/bf0hOfm1/MR9+hRMYfFsdBR66uPbbUxKz7srrDoSCFSVvtSvKKBkYF2HgvOmHPIXCyVDtqMtVkp5g8fjFEImRirHGxgUgUT5XVFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQNoIpYu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQNoIpYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C5DC4CEF7;
	Wed,  4 Feb 2026 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770205841;
	bh=1xwVc1jp/H+lrImJ0szhjysOiGn27S6HNSl4UmqBjxg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=JQNoIpYuxfPPq8qjVQ+/gSTcTiDgcfgaPt5VpE7akuhngGvnRARf9hfakuF57oy/I
	 WS3sU+QFotGrJQLpcP+wXFoPgv1jtpovQ6zoNnY7HL+Nj2s5Lu2l4+aR12i+Vn2KQk
	 3auNdzI6fI2pzmoznXczfyQEdAVq5qBPVBNpWrOiCzRX2AHtgK1wu8holo0dYY18/3
	 X7DUSodEy95CBa5eBr5Py9ErlNeZPY9wxkDqerZye9i8KNnELcm7/pNxuxEW77gAJh
	 bA7MOw7nRhKf60dCV55hKfFObbhx2x8XaJzwbEkgXDkNT+zTorq1UWQltaw+ho1R1x
	 4em0Q0niAIM3w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 12:50:37 +0100
Message-Id: <DG65LJ401SCS.S5LFKDR4AEE1@kernel.org>
Subject: Re: [PATCH v2 1/3] rust: alloc: Add shrink_to and shrink_to_fit
 methods to Vec
Cc: "Shivam Kalra" <shivamklr@cock.li>, <cmllamas@google.com>,
 <gregkh@linuxfoundation.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260131154016.270385-1-shivamklr@cock.li>
 <20260131154016.270385-2-shivamklr@cock.li>
 <DG5FEPO6RCK4.17KOY7PRLNFKV@kernel.org> <aYIWd9wzPIRa4gZc@google.com>
 <DG5FWZ2CA3DR.2WBZ27YUYS705@kernel.org>
 <8006f30e-b794-4852-bc10-2981b5d010d8@cock.li>
 <aYMgWr6iDTus0vDE@google.com>
In-Reply-To: <aYMgWr6iDTus0vDE@google.com>

On Wed Feb 4, 2026 at 11:32 AM CET, Alice Ryhl wrote:
> I would kind of prefer that we do this in two steps. First have
> shrink_to() use the implementation it does right now. Then a follow-up
> patch fix the TODOs in vrealloc().

This is fine with me as a short term workaround, but we should only do the =
full
copy under certain conditions only:

  (1) is_vmalloc_addr() returns true.

  (2) The new size of the allocation requires at least one page less in tot=
al.

I.e. if it is a kmalloc() buffer we don't do anything. And if it's a vmallo=
c()
buffer, we only shrink if we can get rid of at least one page, since otherw=
ise
there are no savings effectively.

Shivam do you plan to follow up on the vrealloc() TODOs subsequently?
