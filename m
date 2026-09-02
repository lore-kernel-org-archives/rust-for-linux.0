Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EECF4A43F7;
	Wed,  2 Sep 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364919; cv=none; b=FL9brcSevX9zyOuKa7szVHiUfeH96D1tNWr+KH6SucD0jlse1oXGeQZVDIu9w+VvXR/Nzn0NeNi4e38GtlDzwLLDCPK/mCDoVRv0dY7qgEpU7tfvLqM1dowOYC8tGSqhHE3GKZqJY02qVAv1CBRywzINNtPV7HElM7Qx5+5ZM5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364919; c=relaxed/simple;
	bh=lNe3Ba7BxBtSpCJIv4FBi3l7mYtJ8Pp4aZd3NjEYg2I=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:To:
	 In-Reply-To:Content-Type; b=cX7itHG1EjU9JM6YnXN8DNYHhsZisVtFjUoIkI9R5bnPfHPjdr/zuxazfqbPbPjJqQHOg74cZZAxoa1yiV89bi87sydYW41etPegy6q3VNqxisvoyFK4o3rBqb2ozRcsEmcOGtdOqi2aEeT1GPsAc8PY6264HoiW2xmNTc2Vh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIYIZNEs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIYIZNEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FA81F000E9;
	Wed,  2 Sep 2026 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788364918;
	bh=v2MKPL2ilgf36vg28DExOZwSoGRvX2hjjdWvV3dbH1k=;
	h=Date:Subject:Cc:References:From:To:In-Reply-To;
	b=gIYIZNEsh/jfz836LWq/ZaOqeMen3elQKlPKFIOFU+3FufybyYGkLi6TamHKULkSK
	 RgnXGw0mKOLVbXR7xjTbIAAKabY3VS+U2Cy/1xWe5FSgwMAQrHGJeRhPUT+IPzkli/
	 +7A4qgq+KTBZXriAVaYmvlF3U27TZDmkHdLMTEiw7JVF/eAGUGniUzUoQxa+CpNymN
	 fLnqRYCssYxbmxKdQGNlAzbUzX4Xxac0nr4waSe69LrkRD91FANrWvIq+7ssSPskT3
	 cQjg2vefIG5nVno0XZ5cXmfugxR9uphTmUar4MgTO/iawkPuTk7CcvleUKE8qF8ODN
	 1VnvhQeWKaWIA==
Message-ID: <19c558bc-d47d-4b67-8db7-d5b9b9d0bce7@kernel.org>
Date: Wed, 2 Sep 2026 18:01:54 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust
 [ALLOC]
Cc: ljs@kernel.org, vbabka@kernel.org, liam@infradead.org, urezki@gmail.com,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260826132729.3281308-1-dakr@kernel.org>
 <20260902155842.1649192-1-dakr@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
To: aliceryhl@google.com
In-Reply-To: <20260902155842.1649192-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/26 5:58 PM, Danilo Krummrich wrote:
> On Wed, 26 Aug 2026 15:27:18 +0200, Danilo Krummrich wrote:
>> [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]
> 
> Applied, thanks!
> 
>   Branch: alloc-next
>   Tree:   git@github.com:Rust-for-Linux/linux.git
> 
> [1/1] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]
>       commit: 82134823a07b
> 
> The patch will appear in the next linux-next integration (typically within 24
> hours on weekdays).
> 
> The patch is queued up for the upcoming merge window for the next major kernel
> release.

Thanks for stepping up Alice, it's much appreciated!
