Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E2319857;
	Mon, 29 Dec 2025 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017229; cv=none; b=LDKgPFJLtuBq3WV+G8fgviVN1CAx7i2xZOKWpgzMi1XJQyIjnkxqaEi0zyAqGuyqvDHqk4lfKaVVV3NClcYfinJHtOejoXHoRHki/zGpIBvi1haEdwQj51tmdIDL5N0UqfqxDVk8T5wnduHq/vM6QHPNEKx9qAou/Sd0Lx+9IfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017229; c=relaxed/simple;
	bh=IFEMTNnhI4ls4RRVBAJ1xCaCaiwxfFgDBu2wJogVgEA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uUcNx9HWq9MFQwdrvYWYRZGaLJK6+QS0A6ODtQwdfvrYgxQOXN3ay9dcKj3kUcOL38vLQDQUgXP/4X64RyhR2Dyz6EeHcJW4CYXIA8jGddPkTpnSsw+wJmJKocXFhJR8JhBOdUrWu//B0J4kVEMueDpGx4vKWbdiDu7/pQUnPHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wy6PGYqD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wy6PGYqD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BCFC4CEF7;
	Mon, 29 Dec 2025 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767017229;
	bh=IFEMTNnhI4ls4RRVBAJ1xCaCaiwxfFgDBu2wJogVgEA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Wy6PGYqDzO8gc8yu4ASB0rqrE0yDXH+Ii4PvOJkk/6kHNZ8/l8aJLNV3+eYNKbtGg
	 MVvVXnusdgzoTc1+7LeGnIh81ykWvrBx3JjK1YOPirP9pZuJbYms9bzRZVF6sDknxu
	 sXqwGZGuurMBN3A7MaWiCa9Nb/qQgs3qCXUkZul5n74yWWYlYqgUmgXlm3PIREIPsV
	 f44QxueI4NIvno98JzZrzl8XUBf+FFdEDYLtE8EBsJRrFWCqdr/aWm6FPrziS9twv1
	 wxuditNDYM4f2SoOCeFbicNYyMa+5H78Hl8eNS2byC/aN7iPQG5+htDzfQKDcSxVd8
	 fAwRC068oN+wQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 15:07:05 +0100
Message-Id: <DFARBV6C1ITF.32UCXF6AYE2A8@kernel.org>
Subject: Re: [PATCH v2] rust: device_id: replace incorrect word in safety
 documentation
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Yilin Chen" <1479826151@qq.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <tencent_C18DD5047749311142ED455779C7CCCF3A08@qq.com>
In-Reply-To: <tencent_C18DD5047749311142ED455779C7CCCF3A08@qq.com>

On Sun Dec 28, 2025 at 5:53 PM CET, Yilin Chen wrote:
> The safety documentation incorrectly refers to `RawDeviceId` when
> transmuting to `RawType`. This fixes the documentation to correctly
> indicate that implementers must ensure layout compatibility with
> `RawType`, not `RawDeviceId`.
>

Fixes: 9b90864bb42b ("rust: implement `IdArray`, `IdTable` and `RawDeviceId=
`")

> Signed-off-by: Yilin Chen <1479826151@qq.com>

Applied to driver-core-linus, thanks!
