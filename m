Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352B14D719;
	Sat, 18 Apr 2026 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471322; cv=pass; b=uOX79xEHEEje7QVZkk73dZ6YfLwvMEl98vWG9vTyui8V+QKPwiBpHmf7N7KaT+wLXpGnQdIik5SNuXtnRI9SrO0oZAlXAtx+b+wI0Zahl9kNpAlQUlrroTYoZkScjbcc1DVgrjgqTy/M9Ct5Tzz0Kbl4/qiF4YviCIwoVYt/Qp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471322; c=relaxed/simple;
	bh=GvA29jwGtdcOSbWWjRJIvy/9DUjQD11nXQWoxkKxGUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfKlE59hbA7MkIuB2z3nVcbNUAyjYbIJvddRdprHuvCjkNNjtYRJZ89Vjp2x82/Q5RTqDk4ViLxC25XnQr0PKHnMnihFTEwLyD2bFXn1tMI0qhllyWIWdVlsV1SeA4JaQWdjenpbSThx8TIjwu+IdO3M79QHqH3j6ADi0bhjwcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=DFoFh3u+; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="DFoFh3u+"
ARC-Seal: i=1; a=rsa-sha256; t=1776471290; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Guxlyh80DUt5ICo+KhSeU3676tMSDH9CFL98AfYGyzbs/1quPtnPwJte9LxhfspBKE82m3fqqnYrShlQOwpm41CYfUQR56GY2Es13UYJyECfNBvKIS4bGyMrwN22HkZJzP/+fayfcv2C8cFUqr5c+1537FR15r8CbGFPTxVgI64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776471290; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1jWPUsYlvbemv6wULx8VhAx6W3qWmNB/aw/dH7b5KFE=; 
	b=AITidAhJa7MjgrXI9iIs6qohh+eG/6zs6XkWg8WhIvDhYHCTXe2WhX32FjscRLWOyBr/3ESAxHndu+9TkDCb9Y4e3RaHZh9rlLmkJYDOSAtbAZJgQcWd2C5WyJnp7/xSJ3KrklmiUzCsto+KH9NFshMOa0fC1ze6+GTxJKHvNAg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776471289;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=1jWPUsYlvbemv6wULx8VhAx6W3qWmNB/aw/dH7b5KFE=;
	b=DFoFh3u+Oy3JSKEGqQgTbR/0ph2NvmBF+topU5NXh0RlMxS1JyAOK7Xoa3ZaKxc4
	MA3saTdRV/IfhE6D+ofo4448TfIZhsSb9dJA4JOtAtaWYY/En0+hSi8ynXwSLdwQsTW
	nQPUAQx0H/BtZqDIHF7kQrpbmVjRiiWJOngb4yzQ=
Received: by mx.zohomail.com with SMTPS id 1776471286964358.79542544682465;
	Fri, 17 Apr 2026 17:14:46 -0700 (PDT)
Date: Fri, 17 Apr 2026 17:14:45 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 1/4] rust: sizes: add SZ_4G constant
Message-ID: <aeLM9fB_LtCjbBrw@um790>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-1-41c6e9bb061c@linux.dev>
 <DHV3SQ191564.3FMK513OJUMKV@nvidia.com>
 <cb3dd598-04f8-486c-ba6b-9965d93170a0@linux.dev>
 <DHVHKSI90H02.143VLYN9JY4FZ@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHVHKSI90H02.143VLYN9JY4FZ@nvidia.com>

On Fri, Apr 17, 2026 at 11:06:30PM +0900, Alexandre Courbot wrote:
> On Fri Apr 17, 2026 at 8:56 PM JST, Alvin Sun wrote:
> >> Finally, maybe I missed something but the new value doesn't appear to be
> >> used by this series?
> > This patchset is a prerequisite for the Tyr ioctls patchset [2] that I'm
> > currently developing, which hasn't been submitted to the list yet.
> 
> Why not have this patch in the series that actually makes use of it?
> It's a bit confusing to see code merged without any clear user in the
> same context.

Ah sorry I suggested this to Alvin since his Tyr patch series that uses
SZ_4G depends on so many other patches series that could change out
from under him. And I thought it was general enough that we could get it
in place before hand or at least get some early feedback.

But either way is fine of course.

Thanks
Deborah

