Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132F18755C
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Oct 2024 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729332255; cv=none; b=CnZVQoj2/EudIf9ca1rJzHjoFG8uQV+u5/GVoURtiKE9uiQKQUw9/MewgMtouMF7Y/QJUnUuIv85ilBkFBi9yf1zMET/MDKOlwZzGMB/wUrSMjhKguwNFCdwR9XCNdEd26IS4JU2X0eEDHS5H8MBGc59+WJgVvha5sLgJ9/T6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729332255; c=relaxed/simple;
	bh=cKriIWIGyM/ZUbTffbOZfU3d4HH1Kt0jJhIQDqAXDLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOICe3bwiJnF7F9u4scQ4PqUeN7Y9PCcJFxFLtrg4PzMAqgoIL/V6oEcaVLpX5RHATSB6FtZ9NGxfzI6EmHSR6rYvnYOc43xo1no3HNHx3QGkOQeS2Q0OvUnLpW1bjZPSodjF7s7dUAx0PwOxkrx8PB25IL6jWUwcjKk3oju3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iC2975dV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iC2975dV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1499FC4CEC5;
	Sat, 19 Oct 2024 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729332254;
	bh=cKriIWIGyM/ZUbTffbOZfU3d4HH1Kt0jJhIQDqAXDLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iC2975dVZP1mXD00z5QjXDfD3idJH0aBfs7Fhhg0+IfpNSMSZ1/rZ2MiurS4/lAdR
	 HFY7jfj9Lx1uU+dn5ZQzXjsDiw0tvtxqMgVqZ1SssqFaJ/j51jn15XssL4vkHHcydC
	 MNLA1X7b+2mzKBJwLBP2SGQhzSQnjkTGkavg7/UY=
Date: Sat, 19 Oct 2024 12:04:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Valentin Obst <kernel@valentinobst.de>
Subject: Re: [PATCH] rust: kernel: fix THIS_MODULE header path in ThisModule
 doc comment
Message-ID: <2024101926-crisply-immersion-5077@gregkh>
References: <ZxOBW2WeAnq_mFda@ohnotp>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxOBW2WeAnq_mFda@ohnotp>

On Sat, Oct 19, 2024 at 06:52:27PM +0900, Yutaro Ohno wrote:
> The doc comment for `ThisModule` incorrectly states the C header file
> for `THIS_MODULE` as `include/linux/export.h`, while the correct path is
> `include/linux/init.h`. This is because `THIS_MODULE` was moved in
> commit 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to
> <linux/init.h>").
> 
> Update the doc comment for `ThisModule` to reflect the correct header
> file path for `THIS_MODULE`.
> 
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>

This should get:

Fixes: 5b20755b7780 ("init: move THIS_MODULE from <linux/export.h> to <linux/init.h>")

added to it when merged.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

