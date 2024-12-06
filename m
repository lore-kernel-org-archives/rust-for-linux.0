Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3821A1FF61F;
	Fri,  6 Dec 2024 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733486775; cv=none; b=YqKjGedhvJjFDPH7Jd4CMpN1gD4+p1JzQZdmwtGt+91SQTCEoBlKLhb1hBs3EwKhTs7xJzEg0V2epy1EYSotg9yufW46bKVUh63akzP7EKhmYhRUHMIwnDxCzop8bv8qjAHPSJjW7hV7UCMIP4sCoHE9LJCGTkXLpcC6eGLU4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733486775; c=relaxed/simple;
	bh=hUjOwJTuLD9amS/2AEHKCka2+TmTRJbtNhQsY1rW9d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsOVK8zb+qxORA8rvU346P2plMNCGHDgsOACC6J88EdN4M+1MsjzB7gRaFVtf3J37Q6i+ZnKcn+9M1Yn8nBa2mI+VHK2up6BdUaNOjheiT9I8xt/mOx1xkleRN1FL+tqusPNqvUtaQFJCc/SFBHxuKHrQnal64G5tay9YamBJPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMLYyAE6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMLYyAE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D64CC4CED1;
	Fri,  6 Dec 2024 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733486775;
	bh=hUjOwJTuLD9amS/2AEHKCka2+TmTRJbtNhQsY1rW9d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMLYyAE6U69K1JSJRdUfmNjU+xbIqyEokMQxgJtE0OjR293Ryl0E5MCWOyKT86kc6
	 l4cIgt1JL7hSaOj/EdYkNKrPV0EMYxjtzBfBRSh5HqXRFGV6iF3DQcQiZCcKAJHXHb
	 mo9LfHlLZgF0N+rz+lQMOO40C4DOGNxxi2ON+XpZkW9+M5a75th6IQGZFyY21A7dMq
	 KLSP3LNUAP8W0rzDbvydx6zbHdtoR6plLwZsxX/OOKBJrZQNfgQfKDBr3yFT//qy+J
	 +SI/CLyg8WFnHPhObcs+3a5BjSCp5AuyviqzWr3NdfLpsWtneyZrZKW1aeNuZXoU7S
	 gDv8p96mQvRoA==
Date: Fri, 6 Dec 2024 12:05:42 +0000
From: Lee Jones <lee@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/5] rust: miscdevice: Provide accessor to pull out
 miscdevice::this_device
Message-ID: <20241206120542.GA7684@google.com>
References: <20241206090515.752267-1-lee@kernel.org>
 <20241206090515.752267-3-lee@kernel.org>
 <CANiq72=e=pNXYGN_=_R_g1UkxTPhdWc+izb0i=7_V+aAzD1c7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=e=pNXYGN_=_R_g1UkxTPhdWc+izb0i=7_V+aAzD1c7w@mail.gmail.com>

On Fri, 06 Dec 2024, Miguel Ojeda wrote:

> On Fri, Dec 6, 2024 at 10:05 AM Lee Jones <lee@kernel.org> wrote:
> >
> > +    /// Returns a pointer to the current Device
> 
> Nit: please use intra-doc links wherever possible (if not possible,
> please at least format type names as code). We also end sentences with
> periods in docs and comments. So e.g.:
> 
>     /// Returns a pointer to the current [`Device`].
> 
> There was a comment about this line in the previous version, v3, but
> there does not seem to be a change. But then again, the title of this
> patch is v3 and not v4 -- not sure what happened here.

This patch should no longer be part of the set after v3.

Looks like v3 was still in the output folder so was sent again with v4
by mistake.  My tooling usually strips out old versions, so I'm not sure
what went wrong specifically.

Thanks for the comment style tips.  I'll make the changes.

-- 
Lee Jones [李琼斯]
