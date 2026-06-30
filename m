Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4D264617
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 03:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782789639; cv=none; b=XMTjaB88B+r/3fwyUqngWc+mvnnBlQfxFYqTijvYCli2XnJK63BI0qhDPQGtukhAnZxEhROVCI2T9ozlzLNGaLIwXjVVBssl2eVQ1HoTKRB9g4Vumr2glxvfEgCb0lWOqcIP/juaJjve6i8tH3BIFeMG3m+AYlPTd56OxWeqyEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782789639; c=relaxed/simple;
	bh=8ifDZFqPY8dieGZlyM18Y3hv6PaZz3igw9QqXLIWUH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icXzNRNQPOKDY8W3kos7A9R1oPOwAAMHcR7w6U9dMfN+yJNCLuV3qTom2l4C/uauiLBkq0fI++h1WrxnDZURi0FGQXJCsTnbsmUeo47xB22jGAuaLInjYUC85ucxenjXy5VltdZiLgYCvMivbDdduX/zy+aJdPldCVakRTIWdL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bvxi9JeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bvxi9JeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08351F00A3D;
	Tue, 30 Jun 2026 03:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782789637;
	bh=7zt11wV8ReQA6npDBq32czJyzQiScvpHoWWCI3i4gwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bvxi9JeANsJlVRstoybGzQySCwSqeKxjhMysjrR52wplpuu7/LmqpPbKC5gA6O8D5
	 aVGJDfw8XZTltZn48XEcsX4GWhSv1/GvL+zUgzH2wTHgUfMp93XuDVsu+0NZ9Yz07I
	 oLWM4i6jHdCB0ZdcBOxg3Qj5g+cEmqgCOY9CejIuIIqbCt89sJg5m/q6fsY0exqM4i
	 cIbab2kle2WyRVmYwPhyJibKrMVg/sg9ZmmhrL1HWP6AKQVdRdf06hgA0HvEXEaySB
	 kpoemabsHvMupGkfxpAP/FCtFr/OEdhrpAkIQZS5xH+cIRmLFpTn1gVzb5DbHjG22U
	 C+OkC9feVHktQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 11F5EF40070;
	Mon, 29 Jun 2026 23:20:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 29 Jun 2026 23:20:36 -0400
X-ME-Sender: <xms:AzZDaugXY7VgPYLAWgw3WbjqZ5s6m55Dm64pJdAB_WwvocWD2S_dIg>
    <xme:AzZDauTVQaEl6irvQpJhjFCi53ZTUM1IsrFHVRAxzdf_KZwAn5RYJaJXjld76Oc5s
    4jbF3seuo3YOjfX0NnZPuyx1WgaN1Lbuf0BVc4ulNuezCJyzrVQOQ>
X-ME-Received: <xmr:AzZDao7ewc-YOpoWI_-gkpu1XPaqPHp5LpjpKUyk4xrGAqBjofy2ffOMXFSGeeNHi5yGLm8s6-c5M-NSpuEFYlghNuPRx8GE>
X-ME-Proxy-Cause: dmFkZTFpEVN9F67NgH014l7nm5M07EqJON6aWe4t3WCDQXil4QHy/33x6wn981dJzyjXsn
    TqCDN7Nh9pOiHWti5ROJ+9jcSitgQp61OxRy2imiuv4yG6RANmVRy0yMihYKK5A8lsnCfb
    SdgjxvZKBhIcyzeHS9EE1BlBDq9Nzd39VuNoGMve/JozUFckG5qOoaVyQ3J8pTsN0YnpfP
    DwlpVr+eXxc7yPeWvgW7I7P3UWa79bcdg3n8uejO4D8cGvzrp1ter0tcV6Zol0hsymr4LY
    zo27Oc/h/gWWOJ59ZBY33VGtDgw4FHxR1ILHC13wDY8Q+GbbvIksSjp7ykcsPiS5IQ7jKk
    hI4K7OZz1j16s0ElFJPArAlEMsH8TbsmcyO5ndmIOCdpByrm8TKieOvGZt+NjNip8cf0LC
    +fV7mK6vmUAIU7J+jiwCglRuwNWIMXZIdS5ztaPNpaEw+fJlTRx16hRb2xMIfjQxYiYYMF
    qHuJFGNeNzx1LtD1sVtj7wrSMiULDznAQqvG6kxAcMi8HxSU3hgvPu/gbulxGCBSE6GTnY
    OxN1NBZ1Y5rCu0FZGdBQn6bCK7f7m2c5HaetoFV8hIimKI/LH7mGa9rxnrn4mMTNDXguy1
    xqCH687F/etb1zPX/qhheCEY9TzCHrrNV0hpIbTFDvyLz872aiilq+OwsiaA
X-ME-Proxy: <xmx:BDZDauwtOW95soc7fpe3yycape5XMEVIDxcCnbFeHayMHZYbJD4tCw>
    <xmx:BDZDagDeduud5inRJej5wQk_oWjxHZYcuLlVgCsNqAkDVraVOIYkIw>
    <xmx:BDZDaubUE5GB4wcuhl9IQAL3CsgP9YY54u598fTOgtVR0RJK37_WDA>
    <xmx:BDZDavEw1FfdxIkEPPAPd4F4bHHGJwb0vk5bUwyXR2njTlJy2s2mcA>
    <xmx:BDZDaqtG8HieU6517LXLPWeKs4W3ZW-FJHUT6djKKGwQl_vizOS8vN-y>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jun 2026 23:20:35 -0400 (EDT)
Date: Mon, 29 Jun 2026 20:20:34 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/5] rust: sync: move lockdep types to
 rust/kernel/sync/lockdep.rs
Message-ID: <akM2AsJ0H4q1aLon@MacBook-0RXW5>
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-1-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-pr-ratelimited-v1-1-cc922f544dc0@google.com>

On Tue, Jun 23, 2026 at 03:38:04PM +0000, Alice Ryhl wrote:
> The lockdep types are currently stored directly in rust/kernel/sync.rs,
> but there are starting to be too many of them to keep them in that file.
> Thus, move them to a submodule.
> 
> For commonly used lockdep logic it's useful to keep re-exports in
> kernel::sync, and this also avoids the need to update any users.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun
