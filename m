Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B256364924;
	Mon,  2 Mar 2026 12:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454524; cv=none; b=upH3AUxNt7w4HlHQaDSHki79OcjwNc+fnnwMR1yqekhdCIhiezdd2NYHw4ZI8/Nf1fiNWLsOigTtvfhPnSl4s0gf9tu75rFpzmK6h/lOSxMIGtOLxnxbUFke/Z86Uh4fyb3t+XSBJeIbtGJpGWkY7uYn2XfvNTpX/R7Ehjy9NS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454524; c=relaxed/simple;
	bh=pppJWZhqbO+BUwuoj7YQnasfi5j/ybVZ9hiQDJe1kZE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=E38je1ThNEyM1Bs+nKUDcsOn4B2aCDcowhA2aQkWo80wlFbCXWKL5DL3TSTRecHq/PHbrXfgv3icSdzfU2oVSdPWjCv7yrTwv3HaQftjDgaL8dkh4a1k3tGY+GUn8NN9rTq8lYwhVgdZECQpwNvsx1BfgiF03dS15NQFNOW6x1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZZjyldL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZZjyldL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26D6C19423;
	Mon,  2 Mar 2026 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454524;
	bh=pppJWZhqbO+BUwuoj7YQnasfi5j/ybVZ9hiQDJe1kZE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=WZZjyldLowkrRJk4nqZ8neKZ1gp3bXcL7erh2Trk5534OmoeUIICBCuLg2YNg4JMg
	 O/JFkFD8lE0VCnjgNx59+mZlikEllYv3TNK183PropYzKXpcH9NSEPlgf/dnrLdZgj
	 R84fdRrB7C91/cWCFj1eqpdZsgXWQ//uUopW2Xt/3j1mK9o0gs/OMZv7FbuU9xbvkR
	 WGovIrGBeadpBHmE43iHYE2n0H5fSgt1ukaslvmVcgnO0ByBZSMvue2bp7DPFtZwEp
	 ZqsoGxcEJyM+r8lqOJ4TchyvCtF78uqEmeypt5+8VpvUtNjTEW3bh0zm84m/avzoh9
	 hKPeVibgn942Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:28:40 +0100
Message-Id: <DGSAOTM95PZ4.2JGBBMNRSJSNN@kernel.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno
 Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
In-Reply-To: <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>

On Sat Feb 28, 2026 at 7:11 AM CET, John Hubbard wrote:
> The sync/async naming that GSP RM uses is a little bit "off". I
> spent some time discussing it with them, and the problem is that
> sync/async is a concept that is somewhat independent of whether
> a reply is expected. Usually, sync means a blocking wait for a
> response, which is not necessarily required in all case with
> GSP RM calls.
>
> The naming would be better here if it reflected simply that
> a response is expected, or not. I don't have great names for
> that, but "fire and forget" works well for what we have so
> far called "async". So we could do create a convention in which
> no annotation means that the API has a response that will come
> back, and some abbreviated for of "fire and forget" or "one way"
> added to the function name would mean that no response is
> expected.

I think the relevant information for the caller is whether the call is bloc=
king
or non-blocking; i.e. do we have cases where we want to block, but discard =
the
reply, or expect a reply but don't want to wait for it?

So, unless there is additional complexity I'm not aware of, I feel like
send_command() and send_command_no_wait() should be sufficient.

(Maybe send_command_wait() if we want to be a bit more explicit.)

As for the specific commands, we could have traits to control whether block=
ing
or non-blocking submissions are allowed for them in the first place, i.e. t=
his
gives us some control about whether a reply is allowed to be discarded thro=
ugh a
_no_wait() submission etc.
