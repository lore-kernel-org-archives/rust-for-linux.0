Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760EB3587A1
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227304; cv=none; b=kle/FSTfGi7Y20C+3HJHyTp5+cUqg0CyXdhO2q16oGaevJfZToZHKR2JoxzL9vgUewApKx4CKqm0XPE9ZzAe0f4CbJEhwg/Yko2desSl/jWr8md3iC0dkZC+/q8v+36fgCPeomoZY6JSH0Q4F/Uj9NLSUgvSuWHNHueH9X2CRz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227304; c=relaxed/simple;
	bh=beVLzk1VDgl0P03C9xNa2Zxpee4MTkpoN+wLVNVXSgk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=R7S27670RjPnSFagBaXMdUa6MlG6dgUSGRuI2zGn7bG57exAij8g7dezXdSWNMDPT8zAmWohAkX0yosyjhq7u1GyHQB13vV9Et/t9J3ZQfABScyC4TULG0BJPrj5aCAkmNOj4SA4QJcSN3Jtfd55JHekmMAIRZKaXaW8r751A/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJ9Tc0pR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJ9Tc0pR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9981FC16AAE;
	Mon, 12 Jan 2026 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768227304;
	bh=beVLzk1VDgl0P03C9xNa2Zxpee4MTkpoN+wLVNVXSgk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=LJ9Tc0pRp71clQLbDENEklDKaT7K9u+5NSWlnoMeTdp2rVk+DU3QXfWErd382nHph
	 Ns6pmBE7BvmFbSP6OLfSOxyEwJy30nY20BGSchOGzZCECHLS3bEBHYySzSPnExDAhj
	 692UafkkioyDrB6Eyq4Oob5Jpa+fucVnUMOCnx01olsCFWGDpcTAXlZUQ1L9Qnkbvf
	 8GeX784zS5LU4ZMXcAwWpcoJm+y4SuXAxLbd7ufa4341N6v/z/TGCMM0uINSKxr7qS
	 E06XZ0SW9N0ocp//GhV4Z9XvKqUFVTdisqAYhei7v2hXw0Px6lu8lpjJR3xLraU9t4
	 4KIzoK0dYZ2ew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 15:15:00 +0100
Message-Id: <DFMO9JVLR5FA.3DNRZH9NDE6X3@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add missing newlines to several
 print strings
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260107201647.2490140-1-ttabi@nvidia.com>
 <20260107201647.2490140-2-ttabi@nvidia.com>
 <49a83146-f292-44c3-8ca4-d62cbdc6a438@nvidia.com>
 <7d2b8106-993a-420a-bb4d-1fd8900e360f@nvidia.com>
 <e15f1221-c146-4fe1-832b-201979b943ed@kernel.org>
In-Reply-To: <e15f1221-c146-4fe1-832b-201979b943ed@kernel.org>

On Fri Jan 9, 2026 at 12:22 AM CET, Danilo Krummrich wrote:
> On 1/9/26 12:12 AM, John Hubbard wrote:
>> Are you comfortable merging these two patches to drm-rust-next? I think
>> they are ready to go at this point.
>
> Yes, they are already on my apply list.

Applied to drm-rust-next, thanks!
