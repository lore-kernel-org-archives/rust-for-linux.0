Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F431F9F71
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Dec 2024 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733130422; cv=none; b=gWvDFTHmHNAjheM3lZYBu7btYKZFDLwpbylXoQXln4YyQzip8KRUezHgpVm3sjKHTP8ASMTddwqeXinQtSKi4o318O5Qv4EdYRBEbxqFoBrMLp0tLn6lE3YjvlpNlVxjzQfHU1pBD65Gm19W7q9IfmgR+sBaFPI2b1pAYM3bSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733130422; c=relaxed/simple;
	bh=MH0IoJ5q5Rnq7lZ6WY9vXnbK6li0wWwdMd4MZA2swbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai+90gIHnOTQ0tFj7zzKkcQRSWNK7BXdsbWN3/oyWOrBqtJAcjzVI71FcwFxhSOaUNcvXi0UYrsziX07ZsiLWYACFIjaJrupxsv8NelAaE/Rsh/GYJ8snaOD5eNPv+ASz8JVEps7f8hrIM0F1vdAWG+fxjHWm+iigZeG7sY8cww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QNQ7qiNt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QNQ7qiNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366D0C4CED9;
	Mon,  2 Dec 2024 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733130421;
	bh=MH0IoJ5q5Rnq7lZ6WY9vXnbK6li0wWwdMd4MZA2swbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNQ7qiNtcxzrZk75JyxbX7o/ZpE+Ns1hWIARbnkbSl9HjnI+eFKz7aXhS+f0e7/SJ
	 ++Edz+G9kMdcZ0zUpAGS2XX0DG6EfsXaFthIH6rQEw3AQZeqZHjbFNr6YhdQd0iVwn
	 c+x8AGsUlyEZU2/3QvPy/v4FEEGI1Mv6PvLRdvGI=
Date: Mon, 2 Dec 2024 10:06:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bernhard Kauer <bk@alpico.io>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: introduce KVec::pop()
Message-ID: <2024120251-plank-rinsing-e63b@gregkh>
References: <20241202085758.67319-1-bk@alpico.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202085758.67319-1-bk@alpico.io>

On Mon, Dec 02, 2024 at 09:57:58AM +0100, Bernhard Kauer wrote:
> Provides a simple stack together with push().

Why?

> 
> Signed-off-by: Bernhard Kauer <bk@alpico.io>
> ---
>  rust/kernel/alloc/kvec.rs | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

What in-kernel code needs this?  Shouldn't you also submit this when
that happens?

thanks,

greg k-h
