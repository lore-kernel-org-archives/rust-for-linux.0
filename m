Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0938BF8F;
	Mon, 19 Jan 2026 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837816; cv=none; b=GV3AAo2gjIuHfCYUN2rFg6qPKbu8DwC2MeLubB7TSBhFtGHQ2Ej2w5EXs1cFDl6W3zoW9eHamaQe9rj7Hm31tMfyIZtVYHzYbufGctucayahwXnB2t18fqqIMfSqrRoKFNQbkMN+FXUqcEHaEBultX+7WLhlZXoS0FuWhHfEL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837816; c=relaxed/simple;
	bh=4bjc5aajcuzBHvXCPRPtvjsISc8dexTvQe1HeiR9z9k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=dBmd10WpeuUQX+phw09JXWJff8g/p7D3ji9s5wPgblwH5Lv6WIJztKbU4aW71kpASyo4ydU3o5R70KH/cIdMNZ8d9/mdop74LUsVJiInrmYVr4vcLqrsGVR81L+Dozwstgz+x8C3ZEi7sqp0wB93EP/iKKvEeE3J5F6quBCpYq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Otq9VxZx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Otq9VxZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADE4C19423;
	Mon, 19 Jan 2026 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768837815;
	bh=4bjc5aajcuzBHvXCPRPtvjsISc8dexTvQe1HeiR9z9k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Otq9VxZxTCDWO7NP/o5dZBtU+J9r7kwGjWWaBS5ZuQFvXYQW6QmPZYzv6lLEZSEh7
	 eIf8etXkH7aluEctAwBnFQfwWBGmNCS8EYcpQzSyDpaHdYfzFmM5MAa6rYQL1pr67F
	 vA23Z9df91ftloLSZ85httOC3PIqxdUsZT2T3ETaEd8GZkLQaSS/6hPMGn5teV0hjN
	 NE0tOqrwZK84qi+OCVdWaScwcK/9jHBVoGnvrpXbYxC0h9bKJzJbnzoRzhK6TLuTzt
	 /jPktw9xMgoQVbVtx6ada4eBunVBCMMj7TeBfjmxbDJPYBfT7e/wUDTdUk0aYLTWpG
	 MnDLlyeo5vHPw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:50:10 +0100
Message-Id: <DFSOO86MMNW8.37S7T88EKPEFA@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 07/10] gpu: nova-core: firmware: fwsec: do not
 require bound device when unneeded
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-7-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-7-dc7b42586c04@nvidia.com>

On Tue Dec 16, 2025 at 5:27 AM CET, Alexandre Courbot wrote:
>      /// Loads the FWSEC firmware into `falcon` and execute it.
> -    pub(crate) fn run(
> -        &self,
> -        dev: &Device<device::Bound>,
> -        falcon: &Falcon<Gsp>,
> -        bar: &Bar0,

Hm..the method also takes a &pci::Bar, so its either called from a bound co=
ntext
or within a Revocable critical section.

Leaving the other argument as &Device<Bound> makes it obvious which one it =
is
(and should be).

> -    ) -> Result<()> {
> +    pub(crate) fn run(&self, dev: &Device, falcon: &Falcon<Gsp>, bar: &B=
ar0) -> Result<()> {
>          // Reset falcon, load the firmware, and run it.
>          falcon
>              .reset(bar)
>
> --=20
> 2.52.0

