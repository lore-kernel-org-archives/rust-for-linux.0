Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2293148DD;
	Wed, 11 Feb 2026 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808422; cv=none; b=pc5YPHaQE5C9r9s35oQXJ1Xv0Hh5JAoXDqasaCFTsH1MjBZHJhXW7R04hDys5+AekWmTk3oVcQqqEjRmWi/+YfbNKuerd5u7rwwnZnZj///QhJg5sX9GQY5a3SHpV7n2kEdb2SuAtkHyNUtvdIQ5isU8NEJYXxO8Y1ATzJkY9Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808422; c=relaxed/simple;
	bh=ae7W4zNihIELFm0uT4GPZhG4pdL4USqe7UGXMZP4dLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQVnS3bkWTZ61PCTFq3LIVtw0yATNdzKc0O4mYz25mjrrtlbztEZ0ggYGHWooRXCw44SqGbgB7QndC0pqwgWP9NxWB8b7Q0FYGjJrEA5+AdBAZh/zdEfnoiDMgJJIG8+s6g4TNOt9csycZqq3cuiv0pTAfyOygjCCGHc1jQj06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=siIYxAhE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="siIYxAhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3DEC19421;
	Wed, 11 Feb 2026 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770808422;
	bh=ae7W4zNihIELFm0uT4GPZhG4pdL4USqe7UGXMZP4dLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=siIYxAhE9agV0m3hezmuB7e4qDsos+p7qEUDgMb5dNmFZp0b/Y14zk4m27RPIqzps
	 L8l1OrfFkLj6v2jD06xNCayUkByQZgguCX6HvXeCW9nziDpYetA9QaoNm8dWUtuR+7
	 PJLX2jiyq6E+RAomnWvcwsRVWuItri5UyjJY7N6w=
Date: Wed, 11 Feb 2026 12:13:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jongan.kim@lge.com
Cc: aliceryhl@google.com, arve@android.com, brauner@kernel.org,
	cmllamas@google.com, tkjos@android.com, a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
	daniel.almeida@collabora.com, gary@garyguo.net,
	heesu0025.kim@lge.com, ht.hong@lge.com, jungsu.hwang@lge.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com, seulgi.lee@lge.com, sunghoon.kim@lge.com,
	tamird@gmail.com, tmgross@umich.edu, viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se, yury.norov@gmail.com
Subject: Re: [PATCH v4 1/3] binder: fix PID namespace collision for freeze
 operation
Message-ID: <2026021121-guiding-finalize-0c4a@gregkh>
References: <20260206085336.32819-2-jongan.kim@lge.com>
 <20260211101737.5703-1-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211101737.5703-1-jongan.kim@lge.com>

On Wed, Feb 11, 2026 at 07:17:37PM +0900, jongan.kim@lge.com wrote:
> On Fri, Feb 06 2026 at 17:53:34PM +0900, jongan.kim@lge.com wrote:

<snip>

> Dear Alice and Android Driver Maintainers,
> 
> I would appreciate it if you could review patch v4.

It has been less than 1 week since you sent this, and we are in the
middle of the merge window when nothing can be accepted at all until
after -rc1 is out.

Please relax, there is no rush here.  If you wish to help out, please
help in reviewing other patches that have been submitted for review, as
that will allow your changes to go up the stack.

thanks,

greg k-h
