Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="SoqSfgcT"
X-Greylist: delayed 63 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Nov 2023 23:20:12 PST
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9335FC5
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 23:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1444; q=dns/txt; s=iport;
  t=1700119212; x=1701328812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zxGcrV6TIXKM6XOMLCjmky0I59jLep/7URAFplAByZ4=;
  b=SoqSfgcTdjUljTFaqRgPFz0HEI3JOu+nS4gLM86h0sHyNN8Cdk48TolX
   t/QLejXA5vj82WwKYS/Ck/Lt7870pYB6KA1bQyewkjHzKfNEH6QyiDvz/
   s7KhULh+MLi9GWhYihzAOac7Sx7EpbZXvm88hyjCfDW163+dyxTCFscIN
   4=;
X-CSE-ConnectionGUID: j/9PcTuBTb2rSv2SeirzKA==
X-CSE-MsgGUID: yEFSu+QYRfSzn+icQVnb0A==
X-IPAS-Result: =?us-ascii?q?A0AMAADTwVVllxbLJq1aDg4BAQEBAQEHAQESAQEEBAEBQ?=
 =?us-ascii?q?IE7BwEBCwGDMlVASAOET4gdX4hjA5JZiyWBJQNWDwEBAQ0BATsJBAEBhQYCh?=
 =?us-ascii?q?yknNAkOAQIEAQEBAQMCAwEBAQEBAQECAQEFAQEBAgEHBBQBAQEBAQEBATcFE?=
 =?us-ascii?q?DWFOwYnDYZGAQIDIw8BOA4QCw4KAgImAgJXBhMIgngBgl4DEQasXnqBMoEBg?=
 =?us-ascii?q?2gDAQ4JJq5/gWIGgRouAYgMAYoOQoFJRIEVgyo+gmEEhTmCaASDa4U6BzKCI?=
 =?us-ascii?q?oMpKY4QXSJHcBsDBwN/DysHBC0bBwYJFBgVIwZRAgIoJAkTEj4EgWOBUQp/P?=
 =?us-ascii?q?w8OEYJAIgIHNjYZSIJbFQw0SnYQKgQUF4ERBGobFR4SJRESFw0DCHQdAhEjP?=
 =?us-ascii?q?AMFAwQzChINCyEFFEIDQgZJCwMCGgUDAwSBNgUNHgIQGgYNJwMDE00CEBQDH?=
 =?us-ascii?q?h0DAwYDCzEDMIEZDFADax82CTwPDB8COQ0nKAIyVgUSAhYDJB02EQkLCSQDK?=
 =?us-ascii?q?QNEHUADeD01FBttnwiDYmI1IgKBTVIUlikBrn2EF4wBlR9JA5cYkleYQI1nm?=
 =?us-ascii?q?kQCBAYFAhaBYzo7gSAzGggbFTuCZ1IZD4pTg2aIc4ogR0IyAg0sAgcBCgEBA?=
 =?us-ascii?q?wmKYQEB?=
IronPort-Data: A9a23:eXmkJKg1R2vGCKebO2wnoSqsX161axcKZh0ujC45NGQN5FlHY01je
 htvCz2AbPiPYGenLdF0Ooux9EoO7ZSDzdQ1TAdpqChmFS9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+1H1dOCn9CEgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZWEULOZ82QsaDlNsvvd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVTmZk5tZkSXqkMqShrefUoMHKF0hU9/011llj3qo
 TlHncTYpQwBZsUglAmBOvVVO3kWAEFIxFPICXr44PSY81DsT3G22c5wVno7PJcK2c8iVAmi9
 dRAQNwMRhmOnae9x6i2D7YqjcU4J86tN4Qa0p1i5WiGVrB9EdaZG/6Mv4UwMDQY3qiiGd7XY
 ssSdD5mdzzLYgZEPREcD5dWcOKA1yekImMH+Dp5o4Imzkbo0U9I4YLjC8jTOd2BfPtTlB6x8
 zeuE2PRW0FGa4P3JSC+2mixnfOKkyThHYYTEqCo3uBljUfVxWEJDhASE1yhrpGRg0q/UN9FO
 kwQ0iUpqqc2+QqgSdyVdxT+oH+CshQbQdV4COQ/8xyLxezf5APxLmIJSDhGLtghr9Q3QxQyz
 FiVmNWvADEHmLeXTmibrYCbrRuqIy8JKmkHbC4ACwAC5rHLqoYqkxSJQNtlH4a6i9T0HXf7x
 DXihDczi64Ui8cF/6q+9FHDxTmro/DhRwo49kPYV3Oj6RlRa4usZoju4l/ehd5HLouVR3GCs
 WIClszY6/oBZbmInTeEQOQXG6CB5PufNjDYx1l1EPEJ+D236lasdJpB7yx5YkFkLq4sfDrgf
 VXeoyte45hcOHbsZqhyC6qtDsswyrP7PcngV/vUKNdCf/BMmBSv9Sx0IE+I2Hrx1U4ljec0O
 IyQdoCnCnNy5blbICSeRaBM6bQX2woCzznJfo6h9Bmmy6i9TSvAIVsaC2emYuc85aKChQza9
 ddDKseHoymztsWjPEE7FqZOcDg3wWgH6YPe9pYMKL/TSuZyMDx7UqWAqV80U9Y995m5gNsk6
 Vmbfie0InLWgXjKMwjCUWxqZNsDtr4m9itmVcDAFXis1mYkZY+p4M8im3oLkVsPqbcLIR1cF
 qdtlyC87hNnEG6vxtjlRcOhxLGOjTzy7e50AwKrYSIkY7lrTBHT99nvc2PHrXZWVnLo7pNl/
 uHxhms3pKbvoSw8VK46j9rxlzuMUYQ1xIqeomOReIAIIRWwmGSUA3ah0qZfzz4wxeXrn2vGi
 Fn+7eYwrujWqIh968jSma2BtO+U/xhWQCJn853gxe/ub0HypzP7qacZCbbgQNwofD6tkElUT
 b4OlK+U3TxutAsijreQ5J4xkfxlvIO0+OUGpummdV2SB2mW5npbCiHu9aFyWmdln9e1ZSPet
 pqzx+Rn
IronPort-HdrOrdr: A9a23:oYa3N6/93UxH3Cyfwp1uk+D9I+orL9Y04lQ7vn2ZhyY7TiW9rb
 HKoB19726RtN9xYgBDpTnuAsO9qB/nmKKdpLNhWotKPzOW21dATrsC0WKK+VSJcBEWtNQ86U
 4KScZD4bPLYWRSvILT/BS4H9E8wNOO7aykwdvFw2wFd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3Ap1WifmtPnTy4YbShefgNcQhL6IsnNSzlx0vNCXO?=
 =?us-ascii?q?yU3xSVueuRF6K6oBNxp8=3D?=
X-Talos-MUID: 9a23:XnoekwpHV1Vam0lI0JIezyBPGvx1oJ2fMk42g5NFusK9Cyp6Yx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.03,307,1694736000"; 
   d="scan'208";a="9639678"
Received: from aer-iport-nat.cisco.com (HELO aer-core-7.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 07:19:05 +0000
Received: from localhost ([10.61.192.247])
	(authenticated bits=0)
	by aer-core-7.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3AG7J40X067593
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 16 Nov 2023 07:19:05 GMT
Date: Thu, 16 Nov 2023 09:19:04 +0200
From: Ariel Miculas <amiculas@cisco.com>
To: Trevor Gross <tmgross@umich.edu>
Cc: Matthew Maurer <mmaurer@google.com>, gary@garyguo.net,
        masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/3] MODVERSIONS + RUST Redux
Message-ID: <uc6ivxodsdimmn4gb5bxoxps5bzni2awzis4v2en4cm6hwlemn@p4wmutv3zgoo>
References: <20231115185858.2110875-1-mmaurer@google.com>
 <CALNs47vtOJ8WcykEtXn==Fn77sqRt9nzPDek-c+625HPfWSx2A@mail.gmail.com>
 <CAGSQo01pE=V+NCdgp-1r_PAfn_48D4yXb91spHf8cZA0Z7GoLA@mail.gmail.com>
 <CAGSQo03pseM9ypkOZuX4UrHN=6kdBRq6a1sGH-T_T6WrOFgXzg@mail.gmail.com>
 <CALNs47suPEkRUzPAmYOJ2t_CCeLBAdbehs=FexL-6--68=KgdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALNs47suPEkRUzPAmYOJ2t_CCeLBAdbehs=FexL-6--68=KgdA@mail.gmail.com>
X-Authenticated-User: amiculas@cisco.com
X-Outbound-SMTP-Client: 10.61.192.247, [10.61.192.247]
X-Outbound-Node: aer-core-7.cisco.com

On 23/11/15 04:54PM, Trevor Gross wrote:
> On Wed, Nov 15, 2023 at 4:24 PM Matthew Maurer <mmaurer@google.com> wrote:
> >
> > Should I be sending all these patches to all the lists? I was trying
> > to follow the recommendations of get_maintainers.pl, which thought
> > modules were the only relevant folks for the export_modules patches.
> > (I also added Gary + Masahiro explicitly due to their involvement with
> > the previous approach.)
> >
> > If I should be sending all the patches to all the lists, should I also
> > be adding all the suggested To/Cc lines for all the patches, or? I
> > didn't see any suggestions on how to approach this in
> > https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch
> 
> I am not an expert here but I think you generally want all patches to
> go to the same group of people / lists. Maybe this isn't a hard and
> fast rule but you lose context if you don't see the cover letter or
> the change as a set. Also patchsets are picked up as a group, so the
> whole thing needs to hit at least one list.
> 
> Probably somebody else could add some more context here.
> 
I'm using lei [1] with --threads option, so I got all the patches. I
doubt that using get_maintainers.pl is the wrong way to go here, and if
it is, the script should be fixed.

Regards,
Ariel

[1] https://people.kernel.org/monsieuricon/lore-lei-part-1-getting-started
