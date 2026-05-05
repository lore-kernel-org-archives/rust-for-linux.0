Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F6F436375;
	Tue,  5 May 2026 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986014; cv=none; b=Cv02kTcPfxeu/z7rKjz13Vh/viUKb2OShAWjYA4AbiT6CSevllY015tRZ/q+X6AERqWMcBsPa1eDL9zCgnB0jcCO886wBRl49hqaQt3QNqjRIuWO4cB8X4aHyLOFVtPwtACJuspOYX4zAZqoIgvqgiPtbm2kCU1z7Qn/5xpThmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986014; c=relaxed/simple;
	bh=5o4lc8TzQ8wTx72Nr3F6ms1JyQFUmtDjauDVxTiAiFU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ufF9jU2MB3fynCzwBxsBFhrBfaS4i0hrT+4hC0rrFRUY56aEOYP7q5tpaDfEw4iuTLKq41JIZ85w0eLDideKY7rJGu0giBzVKY3rIR6Q8oHTYDjMOavaeh21h4XQpxeUnKRb/PGFyL9B9FNQF9Umkrcz3bFxlsOKd/rlAsMYEfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGx3IKdz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGx3IKdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC73FC2BCB4;
	Tue,  5 May 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777986013;
	bh=5o4lc8TzQ8wTx72Nr3F6ms1JyQFUmtDjauDVxTiAiFU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YGx3IKdzI/lTEqzCNvx3WiDnxW9luW6EMQV7+oci86XfghWCdxONPX7gbGWotsKus
	 y5rQNB3K6Qe1uPa9wn0MDXPke62litBEBaD2r/1YsHglgUC+/0B166cygjXX7hAtR5
	 C6KsdZaiOV9IpQCnSHAdfafPqGvz+Dk6boYD/+wNJKw5dV4PGOeFJlwipRU9bik/3+
	 GHyQo9UmoipKnSxcbfXlr72K8Fl1C7fDOiQFhTuvS2G3JWmPvIK8SF2+mTEa8qOn3c
	 5c9LTbPmxOVxvAR4SclsxKTV90fGVxqJJTtis3zGupB1e57SJdpb1p+5fBiBk3bis5
	 84joMroicHDRg==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFNj-00000004f4r-37fd;
	Tue, 05 May 2026 15:00:11 +0200
Date: Tue, 5 May 2026 15:00:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH 9/9] docs: maintainers: add a filtering javascript
Message-ID: <20260505150010.198a303b@localhost>
In-Reply-To: <afcc4dc7-14c8-4a10-aea4-69ae7ed3f37f@infradead.org>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<854faf4127053c203cae479f68e6ac12a4e4aabc.1777908711.git.mchehab+huawei@kernel.org>
	<afcc4dc7-14c8-4a10-aea4-69ae7ed3f37f@infradead.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 May 2026 14:12:50 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 5/4/26 8:51 AM, Mauro Carvalho Chehab wrote:
> > The maintainers table is big. Add a javascript to allow filtering
> > it. Such script is only added at the page which contains the
> > maintainers-include tag.
> > 
> > I opted to keep the search case-sensitive, as, this way,
> > upper case searches at subsystem.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/sphinx/maintainers_include.py | 77 +++++++++++++++++++--
> >  1 file changed, 71 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
> > index bbdadf2aa4f3..f85298627da2 100755
> > --- a/Documentation/sphinx/maintainers_include.py
> > +++ b/Documentation/sphinx/maintainers_include.py  
> 
> > +  function addInput() {
> > +    const table = document.getElementById("maintainers-table");
> > +    if (!table) return;
> > +    let input = document.getElementById("filter-table");
> > +    if (!input) {
> > +      const filt_div = document.createElement('div');
> > +      filt_div.innerHTML = `
> > +        <p>Filter:
> > +          <input type="search" id="filter-table" placeholder="subsystem or property (case-sensitive)" />  
> 
> The "placeholder" string does not fit inside the prompt/entry block so it is
> truncated with no way to tell what the missing part is AFAICT.
> Maybe include that after "Filter:"? E.g.,
> 
>            <p>Filter: (subsystem or property, case-sensitive)
> 
> > +        </p>
> > +      `;  

Makes sense. Changed the logic to:

      filt_div.innerHTML = `
        <p>Filter:
          <input type="search" id="filter-table" placeholder="search string"/>
          subsystem or property (case-sensitive)
        </p>
      `;

-- 
Thanks,
Mauro
