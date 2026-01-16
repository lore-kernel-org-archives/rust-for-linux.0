Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825333939A4
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 20:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594292; cv=none; b=AD5a8rH3c6LPXgqre48qvuCCHcmCyNRWV2EVQVFSKxqXjwDxqUvQ0BMM+JgnHHki9TJ4hHcXhte4L4AtOe7ZLZMlDn9RQ7GH+lO9KwcjyGMf5foBbFuOqvuJLasIIdMO0rf14sYINhrLCM9wxKDW6kPQeKRkNuMoAalPoM74DKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594292; c=relaxed/simple;
	bh=SUGJU/z9xULWbGAdqlZ93K48XB2RdAsxKTdlzA3uZSE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DBEwIWb/znYZBAIUtI73NsrsgBEwa7b70yIWTSnWeH6LelpyCxzZutK+z/gD1GcID4EJfMW04F5GSIpTOWXlaFGafkAOEivOKgpsSrzVzQjjnSIlvNRdbS+0JGHlq5mQDmj7/BCebSDqwkbvIugyHCNB9en2ADtdoNxdKcNdbHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVb3q8qe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVb3q8qe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D48C116C6;
	Fri, 16 Jan 2026 20:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768594292;
	bh=SUGJU/z9xULWbGAdqlZ93K48XB2RdAsxKTdlzA3uZSE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YVb3q8qejxwAKN0Lj2SZ0IE+Z4cSDOIsX5zctf+KDBByy0jAgbKWamXIoAeprr6sT
	 4SOAjkjtEspr4W/LZ6rp7dzl6FbFdNTHXDcMjSggiTcUIkLFl0h/CM06j84zY+/3j/
	 jSf4yCXr1b1EZdOF8b6UQ8dUjLz5/BQiGy6InNEn/Tzb2wmo6/wHwpcl5PL252dk1J
	 7Z58fhbscUITdFlpmNVakEzAyPfoZaywQZs4PWB3mEZrp/N90Q09VyNfT8NsKGtd7h
	 cqR2ZWYNXmlpCIDPCZCSRZnH/7ZObe7DoTBqChYt8++qZZgO6PNi84qmNtOXQmmMRQ
	 uCiyvRUrETL4A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 21:11:29 +0100
Message-Id: <DFQACNZ42CNK.27BOZPAO1T33R@kernel.org>
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the
 HAL
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
 <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
 <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>
In-Reply-To: <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>

On Fri Jan 16, 2026 at 9:08 PM CET, John Hubbard wrote:
> On newer GPU architectures, we don't even *do* a falcon reset, fwiw. For
> example, on Blackwell, the GPU's FSP reboots the GSP by itself. And we
> don't do an FSP reset. So we are all out of the falcon reset business
> there. :)

Great, then let's add the reset() function. :)
