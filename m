Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60043130A73
	for <rust-for-linux@vger.kernel.org>; Fri, 23 May 2025 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989079; cv=none; b=BeZ55Xkl/20DERHQ7aotYUKa2mCIsbpUKlkpbsrip6ozdRwGQUSS5MPR/4732zMIAYuBzGWXF4I0tDYOWUeiPickT4+suzhJqWxx5ASV1seLo3eKjclTBJHNiigiEiKxGFjfTbkZrpx9Iroyt27d450UbVx0O/2ZMbsMiMIv0mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989079; c=relaxed/simple;
	bh=yg/mbm2r1AyHRXUJaSpKz2+dZTvw1xV+bXq37EgIFoY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=q6ovMMI+dIsNKz0gBJsNYt6i+kfO940FqCltybt8Pr3ruSmcqfR6w0sRNLqq4TCW4bpobq4xaZnc9OE2no+FkOM6P40Vq1nP2pSvM79YNhNkJ1pDYxNWnsqGyu/SgG0ko+vTxCarKGncV9ljEr7PhufDethYq6hAnEQiWx/17AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMKR1NCU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMKR1NCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DC9C4CEE9;
	Fri, 23 May 2025 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747989077;
	bh=yg/mbm2r1AyHRXUJaSpKz2+dZTvw1xV+bXq37EgIFoY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=hMKR1NCUQ22G9zWfFPOJvgEhcnvnE9Dw/RJMhgC5qfUtAOUd4TvtEZD4Bm2KV+bgv
	 FtxMuSi8lo0vyXhoockqFq4CflXgxc60vM1i/fPgJe7Prx5k3r9f5p5hn2d5KvaF7o
	 4I50LYv9pOizv8GVsryCMgRDeFenNsw8/Id33t1SWrf3PIU43aRDG2Tl3wTNQ8YryO
	 /YReTy2RTe/cH8yjuuYdzuAe+F1GWWu/sQTNE6Uhzni2YzLTwLW7mE5FtdvyYAk2h6
	 b0zhMr+4e48dx2QbPoKG1ail9tLoZ9G+TiSQwpyoBMg3yHQw6rKNCBhXHmAeXpbunO
	 7nTwyZzjUXczQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 10:31:14 +0200
Message-Id: <DA3EEUYQET6K.2MXO7RY206FOL@kernel.org>
Cc: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <benno.lossin@proton.me>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org> <aCsX-k0K_jqLvD4e@pollux>
 <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
 <2390300b-49d0-4fe5-81b5-5a9f3fd9e300@kernel.org>
In-Reply-To: <2390300b-49d0-4fe5-81b5-5a9f3fd9e300@kernel.org>

On Fri May 23, 2025 at 9:19 AM CEST, Danilo Krummrich wrote:
> On 5/19/25 2:26 PM, Benno Lossin wrote:
>> I'm not happy with the sentence structure, so how about:
>>=20
>> * `data` is valid for reads in two cases:
>>      * while `is_available` is true, or
>>      * while the RCU read-side lock is taken and it was acquired while `=
is_available` was `true`.
>
> That sounds good!
>
>> * `data` is valid for writes when `is_available` was atomically changed =
from `true` to `false`.
>>=20
>> The last one is needed in order to call `drop_in_place`.
>
> If think for this you have the same conditional, in the RCU case you can'=
t call
> drop_in_place() immediately after is_available was altered, but have to w=
ait for
> synchronize_rcu() to return.

Oh yeah, how about:

* `data` is valid for writes when `is_available` was atomically changed fro=
m `true to `false`
  and no thread is holding an RCU read-side lock that was acquired prior to=
 the change in
  `is_available`.

---
Cheers,
Benno
