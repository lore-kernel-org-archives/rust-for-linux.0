Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7FE213E89;
	Wed, 18 Mar 2026 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817926; cv=none; b=P40g8y1cEbRTD7SIM206LaOEyoqWbdg8i8fHpp2mN2FZRzzENrQr9VCbkt1a2O4C+4HyN8WxXe5D+xLrys/jkoz99De9FF1uKKe4uDyQccv4UxGPNQy5IRZHK1MLmIbJd8CZsk/HrcOZ/meoFGyxxMHIjKYxAx/1Pkhp+3POXSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817926; c=relaxed/simple;
	bh=eLMzZe/pdApzRnkr/Cbhp3brCeVn5brRnoJV8iQ7lf8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject; b=CKzLURslBBs9dbnpGsdU8B7DprbWPRCpvB9VSLuGtX39dOKXXyEZyP4I23yiuvTrGfo/BXsSg3mDMnHTnWfAIkkDNapczrNa/g85Sf9ploCOU9UkJRtsrwyP4Ddc8P/VuuutIZfxg8e30TR5MPuD7l15cIbly24IMvFkbwC0arQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bmri8+4x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bmri8+4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25182C19421;
	Wed, 18 Mar 2026 07:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773817925;
	bh=eLMzZe/pdApzRnkr/Cbhp3brCeVn5brRnoJV8iQ7lf8=;
	h=Date:From:To:Cc:Subject:From;
	b=Bmri8+4xnBHhPRkvLypMJsdLdkbZ0St4Vmwby3uUXcZdokSJ9H+e8aTJ4F+/IFEdB
	 axpraaV2+9tewMh+dT3JIZ5uw9vn7YgAIcjfbJnTmtPIvLk3JX6CIOGK7H42PYEbYM
	 qbikJ8Wub/hGwbqkNdOVV7AX49YKxz4mWRRZ+/H0sxZHoJtD0Don9NyUjBjvQll2re
	 vcL10vfUDzVYu0Pmy41ZiLrjRhkIDNDAPRHHQbdkuO6KORiiT7Sz+2Fqg4LkdWrACU
	 hAAWnBA8tuFLIfTqWfDO6GmXMPm7HnsC26Fo0LihAlD+cIwTXyo0JotrXfqjMHO0JF
	 3FBJ6fkxYc9dg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 08:12:03 +0100
Message-Id: <DH5PZ4EWAFK0.1R0BVA8N1GK28@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>
Subject: pin-init feature idea: pinnable option
X-Mailer: aerc 0.21.0

Is anyone interested in having an `Option` that is compatible with
`pin-init`. So where one could store a `Option<Mutex<T>>`. I have a half
baked patch ready in [1], which I think I created before or after
sending [2]. Anyway, I still have it as a branch and would like to get
rid of it if there is no need for it. Otherwise I'd clean it up & send it.

Feel free to reply on the zulip topic [3] as well.

Cheers,
Benno

[1]: https://github.com/Rust-for-Linux/pin-init/commit/fd00f9159eb8ccbd38f8=
9203060c4443cf7b8efd
[2]: https://lore.kernel.org/all/DC73760NQA0X.29E82RNZCV3FS@kernel.org
[3]: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/t=
opic/pinnable.20option/with/580115298
