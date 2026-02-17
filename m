Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D592749E0;
	Tue, 17 Feb 2026 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345704; cv=none; b=A8s2yWlZtJd1OLHKHOtFDR7bqKZ4dwHSDEqlNRIlBarAp6jh1XcQWNCkLScBtVd5F0IEhO+I857OfJ5TlmZeynimAhnVIc0dhpG0BoIpGh87kIZjQMs47LPlmjZrZ3DCaM8vo8+jLjROhy2znpAubHeHxfYUO6L+/tkvATvpIb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345704; c=relaxed/simple;
	bh=6PvgjXW4CK6uLIKsOzCgma+voC7GuRWa6mJGTyCrq24=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=rirxpJmNJtrW5cKlKlNmP+o9hW0Ej1v8gyzLt0WooMhWWdCzkbU81cZ6pNFdYc95rD6IayNORa/zhCz5sOo9CYD7pUgstpSMh8LXDxRV+YbVLfTEBeajM2cg5ab8PKgaAgnSHN3GW8JkWwA5FUdkpx6fvER7CpFx0xIyjz4OaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZdr1k9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZdr1k9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88192C4CEF7;
	Tue, 17 Feb 2026 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771345703;
	bh=6PvgjXW4CK6uLIKsOzCgma+voC7GuRWa6mJGTyCrq24=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=NZdr1k9fyYnjBxCBYlvFugVLfQeqd+lHn8xlavv+HvLnJXmw3fCgz14k/STRzFSzP
	 Pqahzy6zLvG3pbO4CQWIRCD94/GKPRha3K3/LfXig8T7SdsbBWIbaj6KQcf0apk2bf
	 UX5Ov8icGguhB7rP7WUFO2dv8b+lV2tmotGiXCWZmuufSh06kB1rZCPBg4gZi0SkoZ
	 szmdZpMHId4iS0XcX0jG/6vw6EagDSUPMopeNC8g4Cv51F551YVajc10ZwYgthQA/u
	 +QSdgerZrDUuNykuL5KuBd0S0Q7dcVXTuAGZPCH0nMFIiurFnc4OsINRrqL4tAmYx1
	 Nyyey1AH6cUtQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 17:28:17 +0100
Message-Id: <DGHDN7RWDOYF.1XZHUXB3WBOHI@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 18/33] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-19-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-19-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
> +    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
> +    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: u=
size) -> Result<usize> {

Just a quick note, since I just reminded myself on this: We should keep in =
mind
that at some point we have to replace most (if not all) &Bar0 usages with
&Mmio<SIZE> as nova-core will also support platform devices.

I think Tegra chips with GSP-based GPU IPs have a compatible register layou=
t,
right?

(I will prepare a patch to address this for the existing codebase.)
