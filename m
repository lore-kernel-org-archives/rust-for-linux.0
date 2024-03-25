Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F353DABE6
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390896; cv=none; b=S+5BC1ga+U1bKqVohEkhJVW8KMn8TmD4CyrUbzViPHfvEU6xHXaj9rWBiF6HvlI8Mt25raP6jOGGuvVknsvRdbtWD3pki1inT1fXTYvQm0k5WUeL/irYDHKyta6kZwG4u1NcI1i4xb+JU7YY3rBf4z5+15+skcg0QUrEPiCyTfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390896; c=relaxed/simple;
	bh=AV9c25RTiEGEN8J4EeBrFRI8HxDbL7j/xHeWdudm9ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVThfXzuG5AwPC/frRvesMBoj7lwoYlz0r/gJsH9HIcOZk55HvIRDmbZLCE3YbYEO6M4DWS4qPbwBJzXYpPjd9yVh8fqWNDZnUdsdag2/3gY/PpyCSVTjlrABIbp+ItRoJ1mY1P92gk/x2zVkV3M5nyx54BO92yjl7dyDoXKBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rtYZL9Xs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rtYZL9Xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D073AC43390;
	Mon, 25 Mar 2024 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711390895;
	bh=AV9c25RTiEGEN8J4EeBrFRI8HxDbL7j/xHeWdudm9ZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtYZL9XsJ2JAOqBY80THpTAwQQyM3snprj/FMpBOo2jxAnim98LPFZcQYAUZq4rPl
	 MpoauajFPqAv+yfC+FGlsBJ01IFpb96DwZZcYEyT0V6RSw4+HOuZ0YW/8bwjuQEd68
	 8/xfFrs4a0OprrgbVE26JXsjL1Jo0ueMxiZFL0Oo=
Date: Mon, 25 Mar 2024 19:21:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 7/8] rust: add revocable objects
Message-ID: <2024032514-happier-hazelnut-4b50@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-8-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-8-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:11PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> This implements the Revocable and AsyncRevocable types.
> 
> Revocable allows access to objects to be safely revoked at run time.
> 
> This is useful, for example, for resources allocated during device probe;
> when the device is removed, the driver should stop accessing the device
> resources even if other state is kept in memory due to existing
> references (i.e., device context data is ref-counted and has a non-zero
> refcount after removal of the device).

Again, device removal is different from unbinding a driver from a
device.  Please fix this all up.

greg k-h
